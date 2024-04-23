//
//  ProfileDestination.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

enum ProfileDestination {
    case profile(viewModel: ProfileViewModel)
}

extension ProfileDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhs: ProfileDestination, rhs: ProfileDestination) -> Bool {
        switch (lhs, rhs) {
        case let (.profile(lhsVM), .profile(rhsVM)):
            return lhsVM === rhsVM
        }
    }
}

extension ProfileDestination: View {
    var body: some View {
        switch self {
        case let .profile(viewModel):
            ProfileView(viewModel: viewModel)
        }
    }
}
