//
//  AppCoordinatorView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 18.04.24.
//

import SwiftUI

struct AppCoordinatorView: View {
    @StateObject var coordinator: AppCoordinator

    var body: some View {
        coordinator.appState
    }
}
