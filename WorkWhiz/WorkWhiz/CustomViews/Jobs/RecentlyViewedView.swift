//
//  RecentlyViewedView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct RecentlyViewedView: View {
    // MARK: - Properties
    @EnvironmentObject private var theme: AppTheme
    @State var isSaved: Bool

    // MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 10) { item in
                    VStack {
                        Image("mockImage")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .frame(maxWidth: .infinity)
                            .clipped()

                        HStack {
                            Image("mobileApp")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text("vankoowe")
                                    .font(Font.sourceSansPro(.regular, size: 12))

                                Text("New Seller")
                                    .font(Font.sourceSansPro(.regular, size: 12))
                                    .foregroundStyle(.gray)
                            }

                            Spacer()

                            Button {
                                isSaved.toggle()
                            } label: {
                                Image(systemName: isSaved ? "heart.fill" : "heart")
                                    .foregroundStyle(isSaved ? Color.red : Color.gray)
                            }.padding(.horizontal, theme.spacingTokens.padding.padding8)
                        }
                        .padding(.top, theme.spacingTokens.padding.padding8)
                        .padding(.leading, theme.spacingTokens.padding.padding4)

                        HStack {
                            Text("Integrate KeychainSwift to your project")
                                .font(Font.sourceSansPro(.regular, size: 12))
                                .padding(.vertical, theme.spacingTokens.padding.padding8)

                            Spacer()
                        }
                        .padding(.horizontal, theme.spacingTokens.padding.padding12)

                        HStack(spacing: 1) {
                            Image(systemName: "star.fill")
                            Text("4.9")

                            Text("(40)")
                                .foregroundStyle(Color.gray)
                                .font(Font.sourceSansPro(.regular, size: 12))

                            Spacer()

                            Text("From ")
                                .font(Font.sourceSansPro(.regular, size: 12))
                                .foregroundStyle(theme.colorTheme.text.black)

                                +

                            Text("$15")
                                .font(Font.sourceSansPro(.regular, size: 16))
                                .foregroundStyle(theme.colorTheme.text.black)

                        }.padding(.horizontal, 8)
                            .font(Font.sourceSansPro(.semibold, size: 14))
                            .foregroundStyle(theme.colorTheme.primary.primary)

                        Spacer()
                    }

                    .background(Color.white)
                    .frame(width: 250, height: 280)
                    .cornerRadius(8)
                    .shadow(color: Color(.systemGray3).opacity(0.5), radius: 5, x: 0, y: 2)
                }
            }
            .padding(.horizontal, theme.spacingTokens.padding.padding20)
        }
    }
}

#Preview {
    RecentlyViewedView(isSaved: false)
        .environmentObject(AppTheme())
}
