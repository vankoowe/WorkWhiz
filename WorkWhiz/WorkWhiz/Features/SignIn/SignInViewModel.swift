//
//  SignInViewModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import Foundation

enum LoginType: String {
    case google
    case facebook
}

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @MainActor
    var successfulLogin: (Event)?

    var signUpSelected: (Event)?
    var forgotPasswordSelected: (Event)?

}
