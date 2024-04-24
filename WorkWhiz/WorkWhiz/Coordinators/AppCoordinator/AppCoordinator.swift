//
//  AppCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 18.04.24.
//

import SwiftUI
import KeychainSwift

typealias Communication = SignInCommunication & SignUpCommunication

class AppCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()
    var communicationManager: Communication

    @Published var appState: AppDestination
    // TODO: Implement communication Manager for requests

    init(communicationManager: Communication) {
        self.communicationManager = communicationManager

        if KeychainSwift().authToken != nil {
            appState = .tabBar(TabBarCoordinator())
        } else {
            let coordinator = LoginCoordinator(communication: communicationManager)

            appState = .login(coordinator)

            Task { @MainActor in
                coordinator.successfulLogin = handleLoginSuccess
            }
        }
    }
    
    func start() -> AnyView {
        AnyView(AppCoordinatorView(coordinator: self))
    }
    
    func handleLoginSuccess() {
        appState = .tabBar(TabBarCoordinator())
    }
}
