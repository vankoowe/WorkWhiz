//
//  WorkWhizApp.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 9.03.24.
//

import SwiftUI

@main
struct WorkWhizApp: App {
    @StateObject var appCoordinator: AppCoordinator
    @StateObject var theme = AppTheme()

    init() {
        _appCoordinator = StateObject(wrappedValue: AppCoordinator())
    }

    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
                .environmentObject(theme)
        }
    }
}
