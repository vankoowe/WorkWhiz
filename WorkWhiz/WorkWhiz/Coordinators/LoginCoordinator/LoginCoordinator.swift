//
//  LoginCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

typealias LoginCoordinatorCommunication = SignInCommunication & SignUpCommunication

final class LoginCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()

    @Published var path = [LoginDestination]()
    var initialDestination: LoginDestination

    var communication: LoginCoordinatorCommunication

    @MainActor
    var successfulLogin: (Event)?

    init(communication: LoginCoordinatorCommunication) {
        self.communication = communication

        let signInViewModel = SignInViewModel(communication: communication)

        initialDestination = .signIn(viewModel: signInViewModel)

        Task { @MainActor in
            signInViewModel.successfulLogin = { [weak self] in
                self?.successfulLogin?()
            }
        }

        signInViewModel.signUpSelected = {
            self.signUpSelected()
        }

        signInViewModel.forgotPasswordSelected = {
            self.forgotPasswordSelected()
        }
    }

    func signUpSelected() {
        let signUpViewModel = SignUpViewModel(communication: communication, goBack: { [weak self] in
            self?.path.removeLast()
        })

        signUpViewModel.signInSelected = {
            self.signInSelected()
        }

        Task { @MainActor in
            signUpViewModel.successfulLoginAndRegister = { [weak self] in
                self?.successfulLogin?()
            }
        }

        path.append(.signUp(viewModel: signUpViewModel))
    }

    func signInSelected() {
        if let lastDestination = path.last {
            switch lastDestination {
            case .signIn:
                break
            default:
                path.removeLast()
            }
        }
    }

    func forgotPasswordSelected() {
        let forgotPasswordViewModel = ForgotPasswordViewModel(goBack: { [weak self] in
            self?.path.removeLast()
        })

        path.append(.forgotPassword(viewModel: forgotPasswordViewModel))
    }

    @ViewBuilder
    func start() -> AnyView {
        AnyView(LoginCoordinatorView(coordinator: self))
    }
}
