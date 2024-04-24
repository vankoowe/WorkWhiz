//
//  WorkWhizApp.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 9.03.24.
//

import SwiftUI
import KeychainSwift

@main
struct WorkWhizApp: App {
    @StateObject var appCoordinator: AppCoordinator
    @StateObject var theme = AppTheme()

    init() {
        let oathAdapter = OAuthAdapter()
        _appCoordinator = StateObject(wrappedValue: AppCoordinator(
            communicationManager: CommunicationManager(requestAdapter: oathAdapter, requestRetrier: oathAdapter)))
//        KeychainSwift().clear()
    }

    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
                .environmentObject(theme)
        }
    }
}
