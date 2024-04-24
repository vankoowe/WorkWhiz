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

        jobsViewModel.navigationToDetailJob = { [weak self] (job, isSaved) in
            self?.selectedJob(job: job, isSaved: isSaved)
        }
    }

    func selectedJob(job: Job, isSaved: Bool) {
        let jobDetailViewModel = JobDetailViewModel(job: job, isSaved: isSaved, goBack: { [weak self] in
            self?.path.removeLast()
        })

        path.append(.jobDetail(viewModel: jobDetailViewModel))
    }

    @ViewBuilder
    func start() -> AnyView {
        AnyView(JobsCoordinatorView(coordinator: self))
    }
}
