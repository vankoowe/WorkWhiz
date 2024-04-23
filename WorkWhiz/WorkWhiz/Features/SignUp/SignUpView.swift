//
//  SignUpView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct SignUpView: View {
    // MARK: - Properties
    @StateObject var viewModel: SignUpViewModel
    @EnvironmentObject private var theme: AppTheme
    @FocusState private var focusedTextField: SignUpTextFieldFocus?

    // MARK: - View
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    Color.white
                        .onTapGesture {
                            hideKeyboard()
                        }

                    VStack(spacing: theme.spacingTokens.spacing.spacing20) {
                        VStack(spacing: theme.spacingTokens.spacing.spacing40) {
                            header

                            fields
                        }

                        CustomButton(type: .defaultButton,
                                     font: .bold,
                                     fontSize: 18,
                                     title: "Sign Up") {
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
        }
        .overlay(backButton, alignment: .topLeading)
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden(true)
        .environmentObject(theme)
    }

    private var backButton: some View {
        HStack {
            Button {
                viewModel.goBack()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius8)
                        .foregroundStyle(theme.colorTheme.background.placeholder.opacity(0.25))

                    Image(systemName: "chevron.backward")
                        .renderingMode(.template)
                        .foregroundStyle(theme.colorTheme.primary.primary)
                }
                .frame(width: 24, height: 24)
            }

            Spacer()
        }
        .padding(.horizontal, theme.spacingTokens.padding.padding20)
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
                Text("Welcome To ")
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

            usernameField

            passwordField

            confirmPasswordField
        }
    }

    private var emailField: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            Text("Enter your email")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .font(Font.sourceSansPro(.regular, size: 16))
                .foregroundStyle(theme.colorTheme.text.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                        .stroke(theme.colorTheme.primary.primary.opacity(0.5), lineWidth: focusedTextField == .email ? 2 : 0)
                        .animation(.easeIn(duration: 0.2), value: focusedTextField)
                )
                .background(Color.gray.opacity(0.10))
                .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius12, corners: .allCorners)
                .accentColor(Color.black)
                .focused($focusedTextField, equals: .email)
                .onTapGesture {
                    withAnimation {
                        focusedTextField = .email
                    }
                }
                .onSubmit {
                    withAnimation {
                        if viewModel.userName.isEmpty {
                            focusedTextField = .username
                        } else {
                            focusedTextField = nil
                        }
                    }
                }
        }
    }

    private var usernameField: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            Text("Enter your username")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            TextField("Username", text: $viewModel.userName)
                .font(Font.sourceSansPro(.regular, size: 16))
                .foregroundStyle(theme.colorTheme.text.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                        .stroke(theme.colorTheme.primary.primary.opacity(0.5), lineWidth: focusedTextField == .username ? 2 : 0)
                        .animation(.easeIn(duration: 0.2), value: focusedTextField)
                )
                .background(Color.gray.opacity(0.10))
                .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius12, corners: .allCorners)
                .accentColor(Color.black)
                .focused($focusedTextField, equals: .username)
                .onTapGesture {
                    withAnimation {
                        focusedTextField = .username
                    }
                }
                .onSubmit {
                    withAnimation {
                        if viewModel.password.isEmpty {
                            focusedTextField = .password
                        } else {
                            focusedTextField = nil
                        }
                    }
                }
        }
    }

    private var passwordField: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            Text("Enter your password")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            SecureField("Password", text: $viewModel.password)
                .font(Font.sourceSansPro(.regular, size: 16))
                .foregroundStyle(theme.colorTheme.text.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                        .stroke(theme.colorTheme.primary.primary.opacity(0.5), lineWidth: focusedTextField == .password ? 2 : 0)
                        .animation(.easeIn(duration: 0.2), value: focusedTextField)
                )
                .background(Color.gray.opacity(0.10))
                .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius12, corners: .allCorners)
                .accentColor(Color.black)
                .focused($focusedTextField, equals: .password)
                .onTapGesture {
                    withAnimation {
                        focusedTextField = .password
                    }
                }
                .onSubmit {
                    withAnimation {
                        if viewModel.confirmPassword.isEmpty {
                            focusedTextField = .confirmPassword
                        } else {
                            focusedTextField = nil
                        }
                    }
                }
        }
    }

    private var confirmPasswordField: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            Text("Re-enter your password")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .font(Font.sourceSansPro(.regular, size: 16))
                .foregroundStyle(theme.colorTheme.text.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                        .stroke(theme.colorTheme.primary.primary.opacity(0.5), lineWidth: focusedTextField == .confirmPassword ? 2 : 0)
                        .animation(.easeIn(duration: 0.2), value: focusedTextField)
                )
                .background(Color.gray.opacity(0.10))
                .cornerRadius(radius: theme.spacingTokens.cornerRadius.cornerRadius12, corners: .allCorners)
                .accentColor(Color.black)
                .focused($focusedTextField, equals: .confirmPassword)
                .onTapGesture {
                    withAnimation {
                        focusedTextField = .confirmPassword
                    }
                }
                .onSubmit {
                    withAnimation {
                        if viewModel.email.isEmpty {
                            focusedTextField = .email
                        } else {
                            focusedTextField = nil
                        }
                    }
                }
        }
    }


    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        withAnimation {
            focusedTextField = nil
        }
    }

    private var createAccount: some View {
        HStack(spacing: theme.spacingTokens.spacing.spacing4) {
            Spacer()

            Text("Already have an account?")
                .font(Font.sourceSansPro(.regular, size: 18))
                .foregroundStyle(theme.colorTheme.background.black)

            Button {
                // TODO: Implement navigation for sign up
                viewModel.signInSelected?()
            } label: {
                Text("Sign In!")
                    .font(Font.sourceSansPro(.regular, size: 18))
                    .foregroundStyle(theme.colorTheme.primary.primary)
                    .underline()
            }

            Spacer()
        }
    }

    private var socialLoginsView: some View {
        VStack(spacing: theme.spacingTokens.spacing.spacing20) {
            Text("Or Sign Up With")
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

extension SignUpView {
    enum SignUpTextFieldFocus {
        case email
        case username
        case password
        case confirmPassword
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(goBack: {}))
        .environmentObject(AppTheme())
}
