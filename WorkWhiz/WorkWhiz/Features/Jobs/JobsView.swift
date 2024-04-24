//
//  JobsView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct JobsView: View {
    @StateObject var viewModel: JobsViewModel
    @EnvironmentObject private var theme: AppTheme

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: theme.spacingTokens.spacing.spacing16) {
                ForEach(0 ..< 10) { _ in
                    JobView(isSaved: true, job: .mockJob)
                        .onTapGesture {
                            viewModel.navigationToDetailJob?(.mockJob, true)
                        }
                }
            }
            .padding(.horizontal, theme.spacingTokens.padding.padding20)
        }
        .environmentObject(theme)
    }
}

#Preview {
    JobsView(viewModel: JobsViewModel())
        .environmentObject(AppTheme())
}
