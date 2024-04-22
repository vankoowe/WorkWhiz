//
//  HomeCoordinatorView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @StateObject var coordinator: HomeCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.initialDestination
                .navigationDestination(for: HomeDestination.self) { $0 }
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())       
    }
}
