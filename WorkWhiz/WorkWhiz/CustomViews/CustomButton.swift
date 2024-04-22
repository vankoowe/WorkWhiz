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
    let action: () -> Void
    var font: Font.SourceSansProFont
    var fontSize: CGFloat

    let label: () -> Content

    enum ButtonStyles {
        case defaultButton
    }

    init(type: ButtonStyles,
         font: Font.SourceSansProFont,
         fontSize: CGFloat,
         action: @escaping () -> Void,
         @ViewBuilder label: @escaping () -> Content) {
        self.type = type
        self.font = font
        self.fontSize = fontSize
        self.action = action
        self.label = label
    }

    init(type: ButtonStyles, 
         font: Font.SourceSansProFont,
         fontSize: CGFloat,
         title: String,
         action: @escaping () -> Void) where Content == Text {
        self.init(type: type, font: font, fontSize: fontSize, action: action, label: { Text(title) })
    }
    
    var body: some View {
        switch type {
        case .defaultButton:
            Button(action: self.action, label: self.label)
                .buttonStyle(DefaultButtonStyle(theme: theme, font: font, fontSize: fontSize))
        }
    }
}

struct DefaultButtonStyle: ButtonStyle {
    var theme: AppTheme
    var font: Font.SourceSansProFont
    var fontSize: CGFloat

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.sourceSansPro(font, size: fontSize))
            .frame(maxWidth: .infinity, maxHeight: theme.spacingTokens.padding.padding48)
            .foregroundStyle(theme.colorTheme.text.white)
            .background(theme.colorTheme.primary.gradient)
            .contentShape(Rectangle())
            .background(theme.colorTheme.text.primary)
            .cornerRadius(theme.spacingTokens.cornerRadius.cornerRadius12)
    }
}

#Preview {
    CustomButton(type: .defaultButton, font: .bold, fontSize: 24, title: "Default Button") {}
        .environmentObject(AppTheme())
}
