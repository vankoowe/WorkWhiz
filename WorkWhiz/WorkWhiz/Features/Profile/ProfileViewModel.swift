//
//  ProfileViewModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import Foundation
import KeychainSwift

class ProfileViewModel: ObservableObject {
    @MainActor
    var handleLogout: (Event)?

    func logout() {
        Task { @MainActor in
            do {
                KeychainSwift().clear()

                handleLogout?()
            }
        }
    }
}
