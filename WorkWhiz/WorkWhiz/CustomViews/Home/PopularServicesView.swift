//
//  PopularServicesView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import SwiftUI

struct PopularServicesView: View {
    // MARK: - Properties
    @EnvironmentObject private var theme: AppTheme
    private let cardWidth: CGFloat = 125

    // MARK: - View
    var body: some View {
        VStack {
            Image("mobileApp")
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .clipped()

            Spacer()

            Text("Logo Design")
                .font(Font.sourceSansPro(.semibold, size: 14))

            Spacer()
        }
        .background(Color.white)
        .frame(width: cardWidth, height: 180)
        .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius8, corners: .allCorners)
        .shadow(color: Color(.systemGray3), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    PopularServicesView()
        .environmentObject(AppTheme())
}
