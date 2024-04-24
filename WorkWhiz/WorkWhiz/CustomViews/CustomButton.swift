//
//  CustomButton.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 22.04.24.
//

import SwiftUI

struct CustomButton<Content: View>: View {
    @EnvironmentObject var theme: AppTheme
    let type: ButtonStyles
    var disabled: Bool?
    let action: () -> Void
    var font: Font.SourceSansProFont
    var fontSize: CGFloat

    let label: () -> Content

    enum ButtonStyles {
        case defaultButton
    }

    init(type: ButtonStyles,
         disabled: Bool? = false,
         font: Font.SourceSansProFont,
         fontSize: CGFloat,
         action: @escaping () -> Void,
         @ViewBuilder label: @escaping () -> Content) {
        self.type = type
        self.disabled = disabled
        self.font = font
        self.fontSize = fontSize
        self.action = action
        self.label = label
    }

    init(type: ButtonStyles,
         disabled: Bool? = false,
         font: Font.SourceSansProFont,
         fontSize: CGFloat,
         title: String,
         action: @escaping () -> Void) where Content == Text {
        self.init(type: type, disabled: disabled, font: font, fontSize: fontSize, action: action, label: { Text(title) })
    }
    
    var body: some View {
        switch type {
        case .defaultButton:
            Button {
                self.action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius12)
                        .foregroundStyle(disabled ?? false ? LinearGradient(
                            gradient: Gradient(colors: [Color.gray, Color.gray]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ) : theme.colorTheme.primary.gradient)

                    self.label()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: theme.spacingTokens.padding.padding48)
            .cornerRadius(theme.spacingTokens.cornerRadius.cornerRadius12)
            .disabled(disabled ?? false ? true : false)
            .buttonStyle(DefaultButtonStyle(theme: theme, font: font, fontSize: fontSize, disabled: disabled))
        }
    }
}

struct DefaultButtonStyle: ButtonStyle {
    var theme: AppTheme
    var font: Font.SourceSansProFont
    var fontSize: CGFloat
    var disabled: Bool?

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.sourceSansPro(font, size: fontSize))
            .foregroundStyle(theme.colorTheme.text.white)
            .contentShape(Rectangle())
    }
}

#Preview {
    CustomButton(type: .defaultButton, font: .bold, fontSize: 24, title: "Default Button") {}
        .environmentObject(AppTheme())
}
