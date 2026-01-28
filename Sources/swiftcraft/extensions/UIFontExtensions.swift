//
//  UIFont.swift
//  SwiftCraft
//
//  Created by Michael Mueller on 1/27/26.
//

import UIKit

extension UIFont {
    
    public func fontForTextStyle(textStyle: UIFont.TextStyle) -> UIFont {
        let font = SC.appearance.font
        switch (textStyle) {
            case .largeTitle: return font.largeTitle
            case .title1: return font.title1
            case .title2: return font.title2
            case .title3: return font.title3
            case .headline: return font.headline
            case .body: return font.body
            case .callout: return font.callout
            case .subheadline: return font.subheadline
            case .footnote: return font.footnote
            case .caption1: return font.caption1
            case .caption2: return font.caption2
            default: return font.body
        }
    }
    
}
