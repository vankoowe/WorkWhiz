//
//  HomeView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 22.04.24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject private var theme: AppTheme

    // MARK: - View
    var body: some View {
        NavigationView {
            ScrollView {
                SectionTitleWithSeeAllButtonView(sectionTitle: "Popular services")

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 10) { _ in
                            PopularServicesView()
                        }
                    }
                    .padding(.horizontal, theme.spacingTokens.padding.padding20)
                }

                Image("mockImage")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        VStack {
                            Spacer()
                            Text("Explore beautiful work, picked for you.")
                                .font(Font.sourceSansPro(.bold, size: 18))
                                .foregroundStyle(Color.white)
                                .padding()
                        }
                    )
                    .clipped()
                    .cornerRadius(theme.spacingTokens.cornerRadius.cornerRadius8)
                    .padding(theme.spacingTokens.padding.padding20)

                HStack {
                    Text("What's new on WorkWhiz?")
                        .font(Font.sourceSansPro(.bold, size: 18))
                    Spacer()
                }
                .padding(.horizontal, theme.spacingTokens.padding.padding20)

                NewOnWorkWhizView()

                SectionTitleWithSeeAllButtonView(sectionTitle: "Recently viewed & more")

                RecentlyViewedView(isSaved: false)

                SectionTitleWithSeeAllButtonView(sectionTitle: "Recently Saved")

                RecentlyViewedView(isSaved: true)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("WorkWhizLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "hands.sparkles.fill")
                        .resizable()
                }
            }
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel())
        .environmentObject(AppTheme())
}
