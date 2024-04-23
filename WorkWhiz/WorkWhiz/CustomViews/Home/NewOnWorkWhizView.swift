//
//  NewOnWorkWhizView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import SwiftUI

struct NewOnWorkWhizView: View {
    // MARK: - Properties
    @EnvironmentObject private var theme: AppTheme

    // MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) {_ in
                    Image("mobileApp")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .overlay(
                            ZStack {
                                Color.black.opacity(0.5)
                                VStack {
                                    Text("Explore beautiful work, picked for you.")
                                        .foregroundStyle(Color.white)
                                        .font(Font.sourceSansPro(.semibold, size: 24))
                                        .padding()

                                    Spacer()
                                }
                            }
                        )
                        .clipped()
                        .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius8, corners: .allCorners)
                }
            }
            .padding(.horizontal, theme.spacingTokens.padding.padding20)
        }
    }
}


#Preview {
    NewOnWorkWhizView()
        .environmentObject(AppTheme())
}
