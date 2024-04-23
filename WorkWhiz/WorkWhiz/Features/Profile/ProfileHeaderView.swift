//
//  ProfileHeaderView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import SwiftUI

struct ProfileHeaderView: View {
    // MARK: - Properties

    @EnvironmentObject private var theme: AppTheme
    fileprivate let cardHeight: CGFloat = UIScreen.main.bounds.height / 8

    // MARK: - View

    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("mockImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(
                        VStack {
                            Spacer()

                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .background(Circle().fill(.green))
                                .frame(width: 15, height: 15)
                                .padding(.leading, theme.spacingTokens.padding.padding40)
                        }
                    )

                VStack(alignment: .leading) {
                    Text("vankoowe")
                        .font(Font.sourceSansPro(.semibold, size: 18))
                        .foregroundStyle(theme.colorTheme.text.white)

                    Text("Personal balance:")
                        .font(Font.sourceSansPro(.regular, size: 15))
                        .foregroundStyle(theme.colorTheme.text.white)

                    +

                    Text(" $10000")
                        .font(Font.sourceSansPro(.semibold, size: 15))
                        .foregroundStyle(theme.colorTheme.text.white)
                }
                .foregroundStyle(.white)

                Spacer()

                Button(action: {
                    print("tapped bell")
                    // TODO: Open notification center
                }) {
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(theme.colorTheme.text.white)
                        .frame(width: 20, height: 20)
                }
            }
        }
        .padding(.horizontal, theme.spacingTokens.padding.padding20)
        .frame(width: UIScreen.main.bounds.width, height: cardHeight)
        .background(theme.colorTheme.primary.primary)
        .environmentObject(theme)
    }
}

#Preview {
    ProfileHeaderView()
        .environmentObject(AppTheme())
}
