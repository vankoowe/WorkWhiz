//
//  JobsCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

class JobsCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()
    
    @Published var path = [JobsDestination]()
    
    var initialDestination: JobsDestination
    
    init() {
        let jobsViewModel = JobsViewModel()

        initialDestination = .jobs(viewModel: jobsViewModel)
    }
    
    @ViewBuilder
    func start() -> AnyView {
        AnyView(JobsCoordinatorView(coordinator: self))
    }
}
