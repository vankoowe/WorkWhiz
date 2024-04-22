//
//  AppCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 18.04.24.
//

import SwiftUI
import KeychainSwift

class AppCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()
    
    @Published var appState: AppDestination
    // TODO: Implement communication Manager for requests

    init() {
        
//        let isUserLoggedIn = true
        
//        if isUserLoggedIn {
            appState = .tabBar(TabBarCoordinator())
//        } else {
//            let coordinator = LoginCoordinator(communication: communicationManager)
//            
//            appState = .login(coordinator)
//            
//            Task { @MainActor in
//                coordinator.successfulLogin = handleLoginSuccess
//            }
//        }
    }
    
    func start() -> AnyView {
        AnyView(AppCoordinatorView(coordinator: self))
    }
    
    func handleLoginSuccess() {
        appState = .tabBar(TabBarCoordinator())
    }
}
