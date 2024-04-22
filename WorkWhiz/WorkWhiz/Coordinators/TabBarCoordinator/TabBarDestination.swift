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
        }
    }
    
    case home(coordinator: HomeCoordinator)
    
    var icon: String {
        switch self {
        case .home:
            return "home-icon"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
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
        }
    }
}

extension TabBarDestination: View {
    var body: some View {
        switch self {
        case let .home(coordinator):
            coordinator.start()
        }
    }
}
