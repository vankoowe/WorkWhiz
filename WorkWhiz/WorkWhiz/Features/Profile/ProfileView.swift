//
//  ProfileView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @EnvironmentObject private var theme: AppTheme
    @StateObject var viewModel: ProfileViewModel

    // MARK: - View
    var body: some View {
        VStack {
            ProfileHeaderView()

            Spacer()

            List {
                Section(header:
                    Text("Work Whiz Profile")
                        .font(Font.sourceSansPro(.bold, size: 18))
                        .foregroundStyle(theme.colorTheme.text.black)
                ) {
                    ForEach(SettingsItem.workWhizSettings, id: \.id) { settingItem in
                        HStack(spacing: theme.spacingTokens.spacing.spacing20) {
                            Image(systemName: settingItem.imageName)
                                .renderingMode(.template)
                                .foregroundStyle(Color.gray.opacity(0.5))

                            Text(settingItem.title)
                                .font(Font.sourceSansPro(.semibold, size: 18))
                                .foregroundStyle(theme.colorTheme.text.black.opacity(0.5))
                        }
                        .frame(height: 40)
                    }
                }

                Section(header:
                    Text("General")
                        .font(Font.sourceSansPro(.semibold, size: 20))
                        .foregroundStyle(theme.colorTheme.text.black)
                ) {
                    ForEach(SettingsItem.generalSettings, id: \.id) { settingItem in

                        HStack(spacing: theme.spacingTokens.spacing.spacing20) {
                            Image(systemName: settingItem.imageName)
                                .renderingMode(.template)
                                .foregroundStyle(Color.gray.opacity(0.5))

                            Text(settingItem.title)
                                .font(Font.sourceSansPro(.semibold, size: 18))
                                .foregroundStyle(theme.colorTheme.text.black.opacity(0.5))
                        }
                        .frame(height: 40)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
        .environmentObject(AppTheme())
}
