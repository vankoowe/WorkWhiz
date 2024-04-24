//
//  Communication.swift
//  GymOffice
//
//  Created by Kristina Simova on 26.03.24.
//

import Foundation

protocol SignInCommunication {
    func signIn(email: String, password: String) async throws -> SignInResponse
}

protocol SignUpCommunication {
    func signUp(email: String, username: String, password: String) async throws -> SignUpResponse
}
