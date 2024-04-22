//
//  HomeCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

class HomeCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()
    
    @Published var path = [HomeDestination]()
    
    var initialDestination: HomeDestination
    
    init() {
        let homeViewModel = HomeViewModel()

        initialDestination = .home(viewModel: homeViewModel)
    }
    
    @ViewBuilder
    func start() -> AnyView {
        AnyView(HomeCoordinatorView(coordinator: self))
    }
}
