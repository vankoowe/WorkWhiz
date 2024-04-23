//
//  AppTheme.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

final class AppTheme: ObservableObject {
    @Published var colorTheme = ColorTheme()
    @Published var spacingTokens = SpacingTokens()
}

public struct ColorTheme {
    public let primary = PrimaryColors()
    public let text = TextColors()
    public let background = BackgroundColors()
    public let border = BorderColors()
}

public struct PrimaryColors {
    public let primary = Color(hex: "#ea643f")
    public let secondary = Color(hex: "#e1545d")
    
    public var gradient: LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: [primary, secondary]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    public let errorRed = Color.red
}

public struct TextColors {
    public let white = Color.white
    public let primary = Color.black
    public let secondary = Color.blue
    public let black = Color.black
    public let lines = Color(hex: "#35446A")
}

public struct BackgroundColors {
    public let defaultBackground = Color(hex: "#000D30")
    public let placeholder = Color.gray
    public let secondaryBackground = Color(hex: "#0C1A42")
    public let black = Color.black
}

public struct BorderColors {
    public let white = Color.white
}

public struct SpacingTokens {
    public let spacing = Spacing()
    public let padding = Padding()
    public let cornerRadius = CornerRarius()

    public struct Spacing {
        public let spacing0: CGFloat = 0
        public let spacing2: CGFloat = 2
        public let spacing4: CGFloat = 4
        public let spacing6: CGFloat = 6
        public let spacing8: CGFloat = 8
        public let spacing10: CGFloat = 10
        public let spacing12: CGFloat = 12
        public let spacing16: CGFloat = 16
        public let spacing20: CGFloat = 20
        public let spacing24: CGFloat = 24
        public let spacing28: CGFloat = 28
        public let spacing32: CGFloat = 32
        public let spacing36: CGFloat = 36
        public let spacing40: CGFloat = 40
        public let spacing48: CGFloat = 48
        public let spacing84: CGFloat = 84
    }

    public struct Padding {
        public let padding4: CGFloat = 4
        public let padding8: CGFloat = 8
        public let padding12: CGFloat = 12
        public let padding16: CGFloat = 16
        public let padding20: CGFloat = 20
        public let padding22: CGFloat = 22
        public let padding24: CGFloat = 24
        public let padding28: CGFloat = 28
        public let padding32: CGFloat = 32
        public let padding40: CGFloat = 40
        public let padding42: CGFloat = 42
        public let padding44: CGFloat = 44
        public let padding46: CGFloat = 46
        public let padding48: CGFloat = 48
        public let padding50: CGFloat = 50
        public let padding56: CGFloat = 56
        public let padding52: CGFloat = 52
        public let padding68: CGFloat = 68
        public let padding70: CGFloat = 70
    }

    public struct CornerRarius {
        public let cornerRadius4: CGFloat = 4
        public let cornerRadius8: CGFloat = 8
        public let cornerRadius12: CGFloat = 12
        public let cornerRadius16: CGFloat = 16
        public let cornerRadius20: CGFloat = 20
        public let cornerRadius30: CGFloat = 30
        public let cornerRadius40: CGFloat = 40
    }
}
