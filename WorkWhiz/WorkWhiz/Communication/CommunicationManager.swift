//
//  CommunicationManager.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import Foundation
import Alamofire

class CommunicationManager {
    private class var label: String {
        return "CommunicationManager"
    }

    private let dispatchQueue = DispatchQueue(label: label)

    let defaultHeaders: HTTPHeaders = ["Content-Type": "application/json",
                                       "Accept-Language": "en"]
    let sessionManager: Alamofire.Session

    public init(requestAdapter: RequestAdapter? = nil,
                requestRetrier: RequestRetrier? = nil) {
        var interceptor: Interceptor?

        let serverTrustManager: ServerTrustManager = {
            var evaluators: [String: ServerTrustEvaluating] = [:]

            #if DEBUG
                evaluators["16.171.13.62:5001"] = DisabledTrustEvaluator()
            #endif

            return ServerTrustManager(evaluators: evaluators)
        }()

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary

        if let requestRetrier = requestRetrier,
           let requestAdapter = requestAdapter {
            interceptor = Interceptor(adapter: requestAdapter, retrier: requestRetrier)
        }

        sessionManager = Alamofire.Session(configuration: configuration,
                                           interceptor: interceptor,
                                           serverTrustManager: serverTrustManager)
    }

    private func execute<A>(_ resource: Request<A>) async throws -> A {
        let response = await sessionManager.request(resource.url,
                                                    method: resource.httpMethod,
                                                    parameters: resource.parameters,
                                                    encoding: resource.encoding,
                                                    headers: resource.headers,
                                                    interceptor: .retryPolicy)
            .cacheResponse(using: .cache)
            .redirect(using: .follow)
            .validate()
            .cURLDescription { description in
                print("description: \(description)")
            }
            .serializingDecodable(A.self)
            .response

        print("Response: \(response)")
        switch response.result {
        case let .success(data):
            return data
        case let .failure(error):
            throw error
        }
    }
}

extension CommunicationManager {
    struct Request<A: Decodable> {
        let url: String
        let httpMethod: HTTPMethod
        let headers: HTTPHeaders?
        let parameters: Parameters?
        let parse: (Data) throws -> A
        let encoding: ParameterEncoding

        init(_ url: String,
             httpMethod: HTTPMethod = .get,
             headers: HTTPHeaders? = nil,
             parameters: Parameters? = nil,
             encoding: ParameterEncoding = URLEncoding.default,
             parse: @escaping(Data) throws -> A) {
            self.url = url
            self.httpMethod = httpMethod
            self.headers = headers
            self.parameters = parameters
            self.parse = parse
            self.encoding = encoding
        }
    }
}

extension CommunicationManager.Request where A: Decodable {
    init(_ url: URLConvertible & HTTPMethodConvertible,
         headers: HTTPHeaders? = nil,
         encoding: ParameterEncoding = URLEncoding.default,
         parameters: Parameters? = nil) {
        self.init(url.url,
                  httpMethod: url.method,
                  headers: headers,
                  parameters: parameters,
                  encoding: encoding) { (data) in
            if data.isEmpty && A.self is EmptyResponse.Type,
               let emptyResponse = EmptyResponse() as? A {
                return emptyResponse.self
            }

            let parsed = try JSONDecoder().decode(A.self, from: data)
            return parsed
        }
    }
}

extension CommunicationManager: SignInCommunication {
    func signIn(email: String, password: String) async throws -> SignInResponse {
        let endpoint = Constants.RequestEndpoint.signIn
        let parameters: Parameters = ["email": email,
                                      "password": password]

        return try await execute(Request(endpoint,
                                         headers: defaultHeaders,
                                         encoding: JSONEncoding.default,
                                         parameters: parameters))
    }
}

extension CommunicationManager: SignUpCommunication {
    func signUp(email: String, name: String, password: String) async throws -> SignUpResponse {
        let endpoint = Constants.RequestEndpoint.signUp
        let parameters: Parameters = ["email": email,
                                      "name": name,
                                      "password": password]

        return try await execute(Request(endpoint,
                                         headers: defaultHeaders,
                                         encoding: JSONEncoding.default,
                                         parameters: parameters))
    }
}

struct SignUpResponse: Codable {
    var name: String
    var email: String
}

struct SignInResponse: Codable {
    var accessToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}

struct EmptyResponse: Codable { }
