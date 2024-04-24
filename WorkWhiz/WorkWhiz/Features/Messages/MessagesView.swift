//
//  MessagesView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct MessagesView: View {
    // MARK: - Properties
    @EnvironmentObject private var theme: AppTheme
    @StateObject var viewModel: MessagesViewModel

    // MARK: - View
    var body: some View {
        ScrollView {
            ForEach(0 ..< 10) { item in
                LazyVStack(spacing: theme.spacingTokens.spacing.spacing12) {
                    messageContent
                    
                    Divider()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Messages")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Edit") {
                    viewModel.handleEditButtonTap()
                }.foregroundStyle(theme.colorTheme.primary.primary)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "slider.horizontal.3")
                        .frame(width: 20, height: 20)
                }
            }
        }
        .environmentObject(theme)
    }

    private var messageContent: some View {
        HStack(spacing: theme.spacingTokens.spacing.spacing8) {
            Image("mockImage")
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
                .padding(.leading, theme.spacingTokens.padding.padding8)
                .overlay(
                    VStack(alignment: .trailing) {
                        Spacer()

                        Circle()
                            .strokeBorder(.white, lineWidth: 2)
                            .background(Circle().fill(Color.green))
                            .frame(width: 16, height: 16)
                    }.padding(.leading, theme.spacingTokens.padding.padding48)
                )

            VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing8) {
                HStack {
                    Text("vankoowe")
                        .font(Font.sourceSansPro(.semibold, size: 16))
                        .foregroundStyle(theme.colorTheme.text.black)

                    Spacer()

                    Text("Monday")
                        .font(Font.sourceSansPro(.regular, size: 14))
                        .foregroundStyle(theme.colorTheme.text.black.opacity(0.5))
                }

                Text("Today i have worked on your project. I have worked 6 hours.")
                    .font(Font.sourceSansPro(.regular, size: 14))
                    .foregroundStyle(theme.colorTheme.text.black.opacity(0.5))
                    .lineLimit(2)
            }

            Spacer()
        }
    }
}

#Preview {
    MessagesView(viewModel: MessagesViewModel())
        .environmentObject(AppTheme())
}
