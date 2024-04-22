//
//  FontExtensions.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 21.04.24.
//

import SwiftUI

extension Font {
    enum SourceSansProFont {
        case black
        case blackItalic
        case bold
        case boldItalic
        case extraLight
        case extraLightItalic
        case regular
        case semibold
        case semiboldItalic

        var value: String {
            switch self {
                
            case .black:
                return "Black"
            case .blackItalic:
                return "BlackItalic"
            case .bold:
                return "Bold"
            case .boldItalic:
                return "BoldItalic"
            case .extraLight:
                return "ExtraLight"
            case .extraLightItalic:
                return "ExtraLightItalic"
            case .regular:
                return "Regular"
            case .semibold:
                return "SemiBold"
            case .semiboldItalic:
                return "SemiBoldItalic"
            }
        }
    }

    static func sourceSansPro(_ type: SourceSansProFont, size: CGFloat) -> Font {
        return .custom("SourceSansPro-\(type.value)", size: size)
    }
}
