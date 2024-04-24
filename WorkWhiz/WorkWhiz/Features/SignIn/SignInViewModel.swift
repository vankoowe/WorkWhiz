//
//  SignInViewModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import Foundation
import KeychainSwift

enum LoginType: String {
    case google
    case facebook
}

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @Published var didFailLogin: Bool = false
    @Published var isLoading: Bool = false

    let communication: SignInCommunication

    init(communication: SignInCommunication) {
        self.communication = communication
    }

    @MainActor
    var successfulLogin: (Event)?

    var signUpSelected: (Event)?
    var forgotPasswordSelected: (Event)?

    func login() {
        isLoading = true

        Task { @MainActor in
            do {
                let loginResponse = try await communication.signIn(email: email,
                                                                  password: password)

                KeychainSwift().authToken = SignInResponse(accessToken: loginResponse.accessToken)


                successfulLogin?()
            } catch {
                didFailLogin = true
            }

            isLoading = false
        }
    }

}
