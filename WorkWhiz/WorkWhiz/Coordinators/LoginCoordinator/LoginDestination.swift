//
//  LoginDestination.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

enum LoginDestination {
    case signIn(viewModel: SignInViewModel)
    case signUp(viewModel: SignUpViewModel)
    case forgotPassword(viewModel: ForgotPasswordViewModel)
}

extension LoginDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhs: LoginDestination, rhs: LoginDestination) -> Bool {
        switch (lhs, rhs) {
        case let (.signIn(lhsVM), .signIn(rhsVM)):
            return lhsVM === rhsVM
        case let (.signUp(lhsVM), .signUp(rhsVM)):
            return lhsVM === rhsVM
        case let (.forgotPassword(lhsVM), .forgotPassword(rhsVM)):
            return lhsVM === rhsVM
        default:
            return false
        }
    }
}
extension LoginDestination: View {
    var body: some View {
        switch self {
        case let .signIn(viewModel):
            SignInView(viewModel: viewModel)
        case let .signUp(viewModel):
            SignUpView(viewModel: viewModel)
        case let .forgotPassword(viewModel):
            ForgotPasswordView(viewModel: viewModel)
        }
    }
}
