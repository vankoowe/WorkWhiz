//
//  MessagesCoordinator.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

class MessagesCoordinator: Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()
    
    @Published var path = [MessagesDestination]()
    
    var initialDestination: MessagesDestination
    
    init() {
        let messagesViewModel = MessagesViewModel()

        initialDestination = .messages(viewModel: messagesViewModel)
    }
    
    @ViewBuilder
    func start() -> AnyView {
        AnyView(MessagesCoordinatorView(coordinator: self))
    }
}
