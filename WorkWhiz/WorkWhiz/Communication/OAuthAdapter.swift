//
//  OAuthAdapter.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import Foundation
import Alamofire
import KeychainSwift

class OAuthAdapter: RequestInterceptor {
    typealias RequestRetryCompletion = (Alamofire.RetryResult) -> Void
    var didLogout: Event?

    private let lock = NSLock()
    private let keychain: KeychainSwift
    private var requestsToRetry: [RequestRetryCompletion] = []
    var authToken: SignInResponse? {
        return keychain.authToken
    }

    init(keychain: KeychainSwift) {
        self.keychain = keychain
    }

    let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        
        return Session(configuration: configuration)
    }()

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let loginURL = Constants.RequestEndpoint.serverURL
        guard let absoluteURL = urlRequest.url?.absoluteString, absoluteURL != loginURL else {
            completion(.success(urlRequest))
            return
        }
        var urlRequest = urlRequest
        if let token = authToken?.accessToken {
            urlRequest.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        }
        completion(.success(urlRequest))
    }

    func retry(_ request: Alamofire.Request, for session: Alamofire.Session, dueTo error: Error, completion: @escaping (Alamofire.RetryResult) -> Void) {
        lock.lock()
        
        defer {
            lock.unlock()
        }

        if let _ = request.task?.response as? HTTPURLResponse,
           let _ = authToken {
            requestsToRetry.append(completion)
        } else {
            completion(.doNotRetryWithError(error))
        }
    }
}
