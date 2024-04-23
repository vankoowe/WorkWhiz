//
//  TabBarCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 18.04.24.
//

import SwiftUI
import KeychainSwift

final class TabBarCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()

    @State var selectedDestination: TabBarDestination?
    @Published var destinations: [TabBarDestination] = []


    private lazy var homeCoordinator: HomeCoordinator = {
        return HomeCoordinator()
    }()

    private lazy var jobsCoordinator: JobsCoordinator = {
        return JobsCoordinator()
    }()

    init() {
        destinations = [TabBarDestination.home(coordinator: homeCoordinator),
                        TabBarDestination.jobs(coordinator: jobsCoordinator),
                        TabBarDestination.messages(coordinator: homeCoordinator),
                        TabBarDestination.profile(coordinator: homeCoordinator)]

        selectedDestination = destinations.first
    }

    @ViewBuilder
    func start() -> AnyView {
        AnyView(TabBarCoordinatorView(coordinator: self))
    }
}
