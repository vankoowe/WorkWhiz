//
//  LoginCoordinatorView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

struct LoginCoordinatorView: View {
    @StateObject var coordinator: LoginCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.initialDestination
                .navigationDestination(for: LoginDestination.self) { $0 }
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}
