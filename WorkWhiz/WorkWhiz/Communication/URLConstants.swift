//
//  URLConstants.swift
//  GymOffice
//
//  Created by Stanislav Dinev on 20.03.24.
//

import Foundation
import Alamofire

protocol URLConvertible {
    var url: String { get }
}

protocol HTTPMethodConvertible {
    var method: HTTPMethod { get }
}

struct Constants { }

extension Constants {
    enum RequestEndpoint {
        case signIn
        case signUp

        static var serverURL = "http://16.171.13.62:5001/api"
    }
}

extension Constants.RequestEndpoint: URLConvertible {
    var url: String {
        switch self {
        case .signIn:
            return Self.serverURL + "/login"
        case .signUp:
            return Self.serverURL + "/register"
        }
    }
}

extension Constants.RequestEndpoint: HTTPMethodConvertible {
    var method: HTTPMethod {
        switch self {
        case .signIn, .signUp:
            return .post
        }
    }
}
