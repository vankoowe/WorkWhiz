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
    
    init() {
        let profileViewModel = ProfileViewModel()

        initialDestination = .profile(viewModel: profileViewModel)
    }
    
    @ViewBuilder
    func start() -> AnyView {
        AnyView(ProfileCoordinatorView(coordinator: self))
    }
}
