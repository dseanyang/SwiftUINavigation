//
//  FontsModifier.swift
//  lilith
//
//  Created by Tz-Huan Huang on 2020/7/20.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct FontsModifier: ViewModifier {
    enum Style {
        case title1, title2
        case headline1, headline2, subhead
        case label1, label2, label3, value1, value2, value3
        case body1, body2
        case caption1, caption2
        case button1, button2, button3
        case tab, segment
    }
    
    static let properties: [Style: [(size: CGFloat, height: CGFloat, weight: UIFont.Weight)]] = [
        .title1: [(28, 40, .bold), (28, 40, .semibold)],
        .title2: [(22, 26, .bold), (22, 26, .semibold)],
        .headline1: [(17, 22, .bold), (17, 22, .semibold)],
        .headline2: [(15, 20, .bold), (15, 20, .semibold)],
        .subhead: [(15, 20, .regular), (15, 20, .regular)],
        .label1: [(17, 22, .regular), (17, 22, .regular)],
        .label2: [(15, 20, .regular), (15, 20, .regular)],
        .label3: [(12, 16, .regular), (12, 16, .regular)],
        .value1: [(17, 22, .regular), (17, 22, .regular)],
        .value2: [(15, 20, .regular), (15, 20, .regular)],
        .value3: [(12, 16, .regular), (12, 16, .regular)],
        .body1: [(17, 22, .regular), (17, 22, .regular)],
        .body2: [(15, 20, .regular), (15, 20, .regular)],
        .caption1: [(12, 16, .regular), (12, 16, .regular)],
        .caption2: [(11, 13, .regular), (11, 13, .regular)],
        .button1: [(17, 22, .bold), (17, 22, .semibold)],
        .button2: [(15, 20, .bold), (15, 20, .semibold)],
        .button3: [(13, 18, .bold), (13, 18, .semibold)],
        .tab: [(15, 20, .bold), (15, 20, .semibold)],
        .segment: [(15, 20, .regular), (15, 20, .regular)],
    ]
    
    static var families = [
        "zh_CN": ["Lato", "PingFang SC"],
        "zh_HK": ["Lato", "PingFang HK"],
        "zh_TW": ["Lato", "PingFang TC"],
    ]
    static var fonts: [String: [Style: SwiftUI.Font]] = [:]
    
    static func getLocale () -> String {
        // language formats:
        //   - language
        //   - language-script
        //   - language-region
        //   - language_region
        //   - language-script_region
        //   - language-script-region
        for lang in Locale.preferredLanguages {
            if lang.contains("Hans") { return "zh_CN" }
            if lang.contains("Hant") {
                if lang.hasSuffix("HK") { return "zh_HK" }
                return "zh_TW"
            }
            if lang.hasPrefix("zh") {
                if lang.hasSuffix("CN") { return "zh_CN" }
                if lang.hasSuffix("HK") { return "zh_HK" }
                if lang.hasSuffix("TW") { return "zh_TW" }
            }
        }
        return "zh_TW"
    }
    
    static func getFont(_ style: Style) -> SwiftUI.Font {
        let locale = Self.getLocale()
        if let font = Self.fonts[locale]?[style] { return font }
        guard let property = Self.properties[style], let families = Self.families[locale] else {
            fatalError("unknown locale \(locale) or style \(style)")
        }

        let list = families.enumerated().map { UIFontDescriptor(fontAttributes: [
            .family: $1,
            .size: property[$0].size,
            .traits: [UIFontDescriptor.TraitKey.weight: property[$0].weight],
        ]) }
        let attributes: [UIFontDescriptor.AttributeName: Any] = [
            .cascadeList: list,
            .family: families[0],
            .size: property[0].size,
            .traits: [UIFontDescriptor.TraitKey.weight: property[0].weight],
        ]
        let descriptor = UIFontDescriptor(fontAttributes: attributes)
        let font = SwiftUI.Font(UIFont(descriptor: descriptor, size: property[0].size))
        if Self.fonts[locale] == nil { Self.fonts[locale] = [:] }
        Self.fonts[locale]?[style] = font
        return font
    }
    
    static func printAllFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }

    let style: Style
    func body(content: Content) -> some View {
        guard let property = Self.properties[self.style] else { fatalError("Unknown style \(self.style)") }
        return content.font(Self.getFont(style)).frame(minHeight: property[0].height)
    }
}

extension View {
    func fonts(_ style: FontsModifier.Style) -> some View {
        return self.modifier(FontsModifier(style: style))
    }
}
