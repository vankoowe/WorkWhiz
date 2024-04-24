//
//  Communication.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import Foundation

protocol SignInCommunication {
    func signIn(email: String, password: String) async throws -> SignInResponse
}

protocol SignUpCommunication {
    func signUp(email: String, name: String, password: String) async throws -> SignUpResponse
}
