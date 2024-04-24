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
            let coordinator = TabBarCoordinator()

            appState = .tabBar(coordinator)

            Task {
                await MainActor.run {
                    coordinator.handleLogout = {
                        self.handleLogout(communication: communicationManager)
                    }
                }
            }
        } else {
            let coordinator = LoginCoordinator(communication: communicationManager)

            appState = .login(coordinator)

            Task {
                await MainActor.run {
                    coordinator.successfulLogin = {
                        self.handleLoginSuccess(communication: communicationManager)
                    }
                }
            }
        }
    }
    
    func start() -> AnyView {
        AnyView(AppCoordinatorView(coordinator: self))
    }
    
    func handleLoginSuccess(communication: Communication) {
        let coordinator = TabBarCoordinator()

        appState = .tabBar(coordinator)

        Task {
            await MainActor.run {
                coordinator.handleLogout = {
                    self.handleLogout(communication: communication)
                }
            }
        }
    }

    func handleLogout(communication: Communication) {
        let coordinator = LoginCoordinator(communication: communicationManager)

        appState = .login(coordinator)

        Task {
            await MainActor.run {
                coordinator.successfulLogin = {
                    self.handleLoginSuccess(communication: communication)
                }
            }
        }
    }
}
