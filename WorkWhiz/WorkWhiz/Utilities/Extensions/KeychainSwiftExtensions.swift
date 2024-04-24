//
//  KeychainSwiftExtensions.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import Foundation
import KeychainSwift

extension KeychainSwift {
    enum KeychainConstants: String {
        case accessToken
    }

    var authToken: SignInResponse? {
        get {
            guard let encodedValue = getData(KeychainConstants.accessToken.rawValue),
                  let tokenInfo = try? JSONDecoder().decode(SignInResponse.self, from: encodedValue) else { return nil }

            return tokenInfo
        }
        set(value) {
            guard let encodedValue = try? JSONEncoder().encode(value) else {
                delete(KeychainConstants.accessToken.rawValue)
                return
            }
            set(encodedValue, forKey: KeychainConstants.accessToken.rawValue, withAccess: .accessibleAfterFirstUnlockThisDeviceOnly)
        }
    }
}
