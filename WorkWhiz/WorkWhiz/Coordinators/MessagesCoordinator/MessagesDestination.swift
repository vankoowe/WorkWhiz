//
//  MessagesDestination.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

enum MessagesDestination {
    case messages(viewModel: MessagesViewModel)
}

extension MessagesDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhs: MessagesDestination, rhs: MessagesDestination) -> Bool {
        switch (lhs, rhs) {
        case let (.messages(lhsVM), .messages(rhsVM)):
            return lhsVM === rhsVM
        }
    }
}

extension MessagesDestination: View {
    var body: some View {
        switch self {
        case let .messages(viewModel):
            MessagesView(viewModel: viewModel)
        }
    }
}
