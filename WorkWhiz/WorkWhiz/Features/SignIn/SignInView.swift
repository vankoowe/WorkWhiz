//
//  SignInView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

struct SignInView: View {
    // MARK: - Properties
    @StateObject var viewModel: SignInViewModel
    @EnvironmentObject private var theme: AppTheme

    // MARK: - View
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: theme.spacingTokens.spacing.spacing20) {
                    VStack(spacing: theme.spacingTokens.spacing.spacing40) {
                        header
                        
                        fields
                    }
                    
                    resetPassword
                    
                    CustomButton(type: .defaultButton,
                                 font: .bold,
                                 fontSize: 18,
                                 title: "Sign In") {
                        // TODO: Implement logic
                    }
                    .frame(height: 50)
                    
                    createAccount
                    
                    socialLoginsView
                }
                .padding(.horizontal, theme.spacingTokens.padding.padding20)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
        }
        .scrollIndicators(.hidden)
        .environmentObject(theme)
    }

    private var header: some View {
        VStack(spacing: theme.spacingTokens.spacing.spacing12) {
            HStack(spacing: .zero) {
                Text("Hey ")
                    .font(Font.sourceSansPro(.semibold, size: 24))
                    .foregroundStyle(theme.colorTheme.primary.primary)

                Text("Whizzer 👋")
                    .font(Font.sourceSansPro(.semibold, size: 24))
                    .foregroundStyle(theme.colorTheme.text.black)

                Spacer()

            }

            HStack(spacing: .zero) {
                Text("Welcome Back To ")
                    .font(Font.sourceSansPro(.semibold, size: 24))
                    .foregroundStyle(theme.colorTheme.text.black)

                Text("WorkWhiz")
                    .font(Font.sourceSansPro(.semibold, size: 24))
                    .foregroundStyle(theme.colorTheme.primary.primary)

                Spacer()

            }

            HStack {
                Text("The World Awaits Your Next Move 🌍")
                    .font(Font.sourceSansPro(.semibold, size: 14))
                    .foregroundStyle(theme.colorTheme.text.black)
                    .opacity(0.5)

                Spacer()
            }
            
        }
    }
    private var fields: some View {
        VStack(spacing: theme.spacingTokens.spacing.spacing16) {
            emailField

            passwordField
        }
    }

    private var emailField: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            Text("Enter your email")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            TextField("Email", text: $viewModel.email)
                .font(Font.sourceSansPro(.regular, size: 16))
                .foregroundStyle(theme.colorTheme.text.black)
                .padding()
                .background(Color.gray.opacity(0.10))
                .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius12, corners: .allCorners)
                .accentColor(Color.black)

        }
    }

    private var passwordField: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            Text("Enter your password")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            TextField("Password", text: $viewModel.password)
                .font(Font.sourceSansPro(.regular, size: 16))
                .foregroundStyle(theme.colorTheme.text.black)
                .padding()
                .background(Color.gray.opacity(0.10))
                .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius12, corners: .allCorners)
                .accentColor(Color.black)
        }
    }

    private var resetPassword: some View {
        HStack(spacing: theme.spacingTokens.spacing.spacing4) {
            Spacer()

            Text("Having issues?")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            Button {
                // TODO: Implement request for resetting the password
            } label: {
                Text("Reset password now!")
                    .font(Font.sourceSansPro(.regular, size: 14))
                    .foregroundStyle(theme.colorTheme.background.black)
                    .underline()
            }
        }
    }

    private var createAccount: some View {
        HStack(spacing: theme.spacingTokens.spacing.spacing4) {
            Spacer()

            Text("Don't have an account?")
                .font(Font.sourceSansPro(.regular, size: 18))
                .foregroundStyle(theme.colorTheme.background.black)

            Button {
                // TODO: Implement navigation for sign up
            } label: {
                Text("Create now!")
                    .font(Font.sourceSansPro(.regular, size: 18))
                    .foregroundStyle(theme.colorTheme.primary.primary)
                    .underline()
            }

            Spacer()
        }
    }

    private var socialLoginsView: some View {
        VStack(spacing: theme.spacingTokens.spacing.spacing20) {                
            Text("Or Sign In With")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.text.primary)
                .opacity(0.5)

            HStack(spacing: theme.spacingTokens.spacing.spacing32) {
                socialLogin(loginType: .google)
                socialLogin(loginType: .facebook)
            }
        }

    }

    @ViewBuilder private func socialLogin(loginType: LoginType) -> some View {
        Button(action: {
            // TODO: Implement firebase handling for both social logins
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                    .fill(Color.white)

                HStack {
                    Spacer()

                    Image(getLoginIcon(loginType: loginType))
                        .resizable()
                        .frame(width: 24, height: 24)
                        .aspectRatio(contentMode: .fit)

                    Text(getLoginTitle(loginType: loginType))
                        .font(Font.sourceSansPro(.semibold, size: 14))
                        .minimumScaleFactor(0.5)

                    Spacer()
                }
                .padding(.all, theme.spacingTokens.padding.padding8)
                .foregroundColor(Color.black)
            }
            .background(
                RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                    .stroke(Color.gray))
            .frame(height: 32)
        }
    }

    private func getLoginIcon(loginType: LoginType) -> String {
        var icon = ""
        if loginType == .google {
            icon = "googleIcon"
        } else if loginType == .facebook {
            icon = "facebookIcon"
        }
        return icon
    }

    private func getLoginTitle(loginType: LoginType) -> String {
        var title = ""
        if loginType == .google {
            title = "Google"
        } else if loginType == .facebook {
            title = "Facebook"
        }
        return title
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
        .environmentObject(AppTheme())
}