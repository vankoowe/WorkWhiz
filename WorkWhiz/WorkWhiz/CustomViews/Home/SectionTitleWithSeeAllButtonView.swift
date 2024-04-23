//
//  SectionTitleWithSeeAllButtonView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import SwiftUI

struct SectionTitleWithSeeAllButtonView: View {
    // MARK: - Properties
    @EnvironmentObject private var theme: AppTheme
    let sectionTitle: String

    // MARK: - View
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(Font.sourceSansPro(.bold, size: 18))

            Spacer()

            Button(action: {}) {
                Text("See All")
                    .font(Font.sourceSansPro(.semibold, size: 18))

            }
        }
        .padding(.horizontal, theme.spacingTokens.padding.padding20)
    }
}

#Preview {
    SectionTitleWithSeeAllButtonView(sectionTitle: "Testing")
        .environmentObject(AppTheme())
}
