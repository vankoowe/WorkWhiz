//
//  ForgotPasswordView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import SwiftUI

struct ForgotPasswordView: View {
    // MARK: - Properties
    @StateObject var viewModel: ForgotPasswordViewModel
    @EnvironmentObject private var theme: AppTheme
    @FocusState private var focusedTextField: ForgotPasswordTextFieldFocus?

    // MARK: - View
    var body: some View {
        ZStack {
            Color.white
                .onTapGesture {
                    hideKeyboard()
                }

            VStack(spacing: theme.spacingTokens.spacing.spacing40) {
                VStack(spacing: theme.spacingTokens.spacing.spacing40) {
                    header

                    emailField
                }

                resetPassword

                Button {
                    // TODO: Implement request for forgot password
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                            .foregroundStyle(viewModel.email.isEmpty ? LinearGradient(
                                gradient: Gradient(colors: [Color.gray, Color.gray]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ) : theme.colorTheme.primary.gradient)

                        Text("Request Reset Link")
                            .font(Font.sourceSansPro(.bold, size: 18))
                            .foregroundStyle(theme.colorTheme.text.white)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: theme.spacingTokens.padding.padding48)
                .disabled(viewModel.email.isEmpty)
                .cornerRadius(theme.spacingTokens.cornerRadius.cornerRadius12)
                .frame(height: 50)
            }
            .padding(.horizontal, theme.spacingTokens.padding.padding20)
        }
        .overlay(backButton, alignment: .topLeading)
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
                Spacer()
                Text("Hey ")
                    .font(Font.sourceSansPro(.semibold, size: 24))
                    .foregroundStyle(theme.colorTheme.primary.primary)

                Text("Whizzer 👋")
                    .font(Font.sourceSansPro(.semibold, size: 24))
                    .foregroundStyle(theme.colorTheme.text.black)

                Spacer()
            }

            HStack(alignment: .center, spacing: .zero) {
                Spacer()
                VStack {
                    Text("Have you forgotten your ")
                        .font(Font.sourceSansPro(.semibold, size: 24))
                        .foregroundStyle(theme.colorTheme.text.black)

                    Text("password?")
                        .font(Font.sourceSansPro(.semibold, size: 24))
                        .foregroundStyle(theme.colorTheme.primary.primary)
                }
                Spacer()
            }
        }
    }

    private var emailField: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            Text("Enter your email")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            SecureField("Email", text: $viewModel.email)
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
                        focusedTextField = nil
                    }
                }
        }
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        focusedTextField = nil
    }

    private var resetPassword: some View {
        HStack(spacing: theme.spacingTokens.spacing.spacing4) {
            Text("Don't remember your password? Type your email and reset it!")
                .font(Font.sourceSansPro(.regular, size: 14))
                .foregroundStyle(theme.colorTheme.background.black)

            Spacer()
        }
    }
}

extension ForgotPasswordView {
    enum ForgotPasswordTextFieldFocus {
        case email
    }
}

#Preview {
    ForgotPasswordView(viewModel: ForgotPasswordViewModel(goBack: {}))
        .environmentObject(AppTheme())
}
