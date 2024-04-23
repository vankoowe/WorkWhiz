//
//  TabBarDestination.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 19.04.24.
//

import SwiftUI

enum TabBarDestination: Identifiable {
    var id: String {
        switch self {
        case .home:
            "home"
        case .jobs:
            "jobs"
        case .messages:
            "messages"
        case .profile:
            "profile"
        }
    }
    
    case home(coordinator: HomeCoordinator)
    case jobs(coordinator: JobsCoordinator)
    case messages(coordinator: MessagesCoordinator)
    case profile(coordinator: HomeCoordinator)
    
    var icon: String {
        switch self {
        case .home:
            return "homeIcon"
        case .jobs:
            return "jobsIcon"
        case .messages:
            return "messagesIcon"
        case .profile:
            return "profileIcon"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .jobs:
            return "Jobs"
        case .messages:
            return "Messages"
        case .profile:
            return "Profile"
        }
    }
}

extension TabBarDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhsCoord: TabBarDestination, rhs: TabBarDestination) -> Bool {
        switch (lhsCoord, rhs) {
        case let (.home(lhsCoord), .home(rhsCoord)):
            return lhsCoord === rhsCoord
        case let (.jobs(lhsCoord), .jobs(rhsCoord)):
            return lhsCoord === rhsCoord
        case let (.messages(lhsCoord), .messages(rhsCoord)):
            return lhsCoord === rhsCoord
        case let (.profile(lhsCoord), .profile(rhsCoord)):
            return lhsCoord === rhsCoord
        default:
            return false
        }
    }
}

extension TabBarDestination: View {
    var body: some View {
        switch self {
        case let .home(coordinator):
            coordinator.start()
        case let .jobs(coordinator):
            coordinator.start()
        case let .messages(coordinator):
            coordinator.start()
        case let .profile(coordinator):
            coordinator.start()
        }
    }
}
