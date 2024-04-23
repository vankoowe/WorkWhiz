//
//  ForgotPasswordViewModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    var goBack: Event

    init(goBack: @escaping Event) {
        self.goBack = goBack
    }
}
