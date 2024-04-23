//
//  TabBarCoordinatorView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 19.04.24.
//

import SwiftUI

struct TabBarCoordinatorView: View {
    @StateObject var coordinator: TabBarCoordinator
    @EnvironmentObject var theme: AppTheme

    var body: some View {
        TabView(selection: $coordinator.selectedDestination) {
            ForEach(coordinator.destinations) { destination in
                destination
                    .tabItem {
                        Image(destination.icon)
                            .renderingMode(.template)

                        Text(destination.title)
                            .font(Font.sourceSansPro(.regular, size: 12))
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                    }
            }
            .toolbarBackground(Color.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(theme.colorTheme.primary.primary)
    }
}
