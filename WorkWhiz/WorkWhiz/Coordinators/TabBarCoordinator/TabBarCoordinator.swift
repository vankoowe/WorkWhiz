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

    @MainActor
    var handleLogout: (Event)?

    private lazy var homeCoordinator: HomeCoordinator = {
        return HomeCoordinator()
    }()

    private lazy var jobsCoordinator: JobsCoordinator = {
        return JobsCoordinator()
    }()

    private lazy var messagesCoordinator: MessagesCoordinator = {
        return MessagesCoordinator()
    }()

    private lazy var profileCoordinator: ProfileCoordinator = {
        return ProfileCoordinator(handleLogout: { [weak self] in
            guard let self = self else { return }
            Task { @MainActor in
                self.handleLogout?()
            }
        })
    }()

    init() {
        destinations = [TabBarDestination.home(coordinator: homeCoordinator),
                        TabBarDestination.jobs(coordinator: jobsCoordinator),
                        TabBarDestination.messages(coordinator: messagesCoordinator),
                        TabBarDestination.profile(coordinator: profileCoordinator)]

        selectedDestination = destinations.first
    }

    @ViewBuilder
    func start() -> AnyView {
        AnyView(TabBarCoordinatorView(coordinator: self))
    }
}
