//
//  ProfileCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

class ProfileCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()
    
    @Published var path = [ProfileDestination]()
    
    var initialDestination: ProfileDestination

    @MainActor
    var handleLogout: (Event)?

    init(handleLogout: (Event)?) {
        self.handleLogout = handleLogout

        let profileViewModel = ProfileViewModel()

        initialDestination = .profile(viewModel: profileViewModel)

        Task { @MainActor in
            profileViewModel.handleLogout = { [weak self] in
                self?.handleLogout?()
            }
        }
    }
    
    @ViewBuilder
    func start() -> AnyView {
        AnyView(ProfileCoordinatorView(coordinator: self))
    }
}
