//
//  LoginCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

final class LoginCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()

    @Published var path = [LoginDestination]()
    var initialDestination: LoginDestination

    init() {
        let signInViewModel = SignInViewModel()
        initialDestination = .signIn(viewModel: signInViewModel)
    }

    @ViewBuilder
    func start() -> AnyView {
        AnyView(LoginCoordinatorView(coordinator: self))
    }
}
