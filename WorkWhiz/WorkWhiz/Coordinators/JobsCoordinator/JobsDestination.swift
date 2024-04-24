//
//  JobsDestination.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

enum JobsDestination {
    case jobs(viewModel: JobsViewModel)
    case jobDetail(viewModel: JobDetailViewModel)
}

extension JobsDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhs: JobsDestination, rhs: JobsDestination) -> Bool {
        switch (lhs, rhs) {
        case let (.jobs(lhsVM), .jobs(rhsVM)):
            return lhsVM === rhsVM
        case let (.jobDetail(lhsVM), .jobDetail(rhsVM)):
            return lhsVM === rhsVM
        default:
            return false
        }
    }
}

extension JobsDestination: View {
    var body: some View {
        switch self {
        case let .jobs(viewModel):
            JobsView(viewModel: viewModel)
        case let .jobDetail(viewModel):
            JobDetail(viewModel: viewModel)
        }
    }
}
