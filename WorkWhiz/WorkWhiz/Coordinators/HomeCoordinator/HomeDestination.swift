//
//  HomeDestination.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

enum HomeDestination {
    case home(viewModel: HomeViewModel)
}

extension HomeDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhs: HomeDestination, rhs: HomeDestination) -> Bool {
        switch (lhs, rhs) {
        case let (.home(lhsVM), .home(rhsVM)):
            return lhsVM === rhsVM
        }
    }
}

extension HomeDestination: View {
    var body: some View {
        switch self {
        case let .home(viewModel):
            HomeView(viewModel: viewModel)
        }
    }
}
