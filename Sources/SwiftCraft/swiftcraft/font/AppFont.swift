//
//  AppFont.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

class RoundedFonts {
    
    static let largeTitle: UIFont = {
        let fontSize = 32.0
        let normalFont = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        let resultingFont: UIFont
        if let descriptor = normalFont.fontDescriptor.withDesign(.rounded) {
            resultingFont = UIFont(descriptor: descriptor, size: fontSize)
        } else {
            resultingFont = normalFont
        }
        return resultingFont
    }()
    
    static let title1: UIFont = {
        let fontSize = 28.0
        let normalFont = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        let resultingFont: UIFont
        if let descriptor = normalFont.fontDescriptor.withDesign(.rounded) {
            resultingFont = UIFont(descriptor: descriptor, size: fontSize)
        } else {
            resultingFont = normalFont
        }
        return resultingFont
    }()
    
    static let title2: UIFont = {
        let fontSize = 20.0
        let normalFont = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        let resultingFont: UIFont
        if let descriptor = normalFont.fontDescriptor.withDesign(.rounded) {
            resultingFont = UIFont(descriptor: descriptor, size: fontSize)
        } else {
            resultingFont = normalFont
        }
        return resultingFont
    }()
    
    static let title3: UIFont = {
        let fontSize = 18.0
        let normalFont = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        let resultingFont: UIFont
        if let descriptor = normalFont.fontDescriptor.withDesign(.rounded) {
            resultingFont = UIFont(descriptor: descriptor, size: fontSize)
        } else {
            resultingFont = normalFont
        }
        return resultingFont
    }()
    
}

let customFonts: [UIFont.TextStyle: UIFont] = [
    .largeTitle: RoundedFonts.largeTitle,
    .title1: RoundedFonts.title1,
    .title2: RoundedFonts.title2,
    .title3: RoundedFonts.title3,
    .headline: UIFont.systemFont(ofSize: 16, weight: .semibold),
    .body: UIFont.systemFont(ofSize: 15, weight: .regular),
    .callout: UIFont.systemFont(ofSize: 15, weight: .semibold),
    .subheadline: UIFont.systemFont(ofSize: 15, weight: .medium),
    .footnote: UIFont.systemFont(ofSize: 13, weight: .regular),
    .caption1: UIFont.systemFont(ofSize: 12, weight: .semibold),
    .caption2: UIFont.systemFont(ofSize: 12, weight: .medium)
]

extension UIFont {
    
    public class func scalingFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
        let customFont = customFonts[style]!
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: customFont)
    }
    
    public class func nonScalingFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
        return customFonts[style]!
    }
    
}
