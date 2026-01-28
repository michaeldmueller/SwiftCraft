//
//  Constants.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

public struct SCAppearance {

    public var margin: Margin = Margin()
    public var text: Text = Text()
    public var color: Color = Color()
    public var buttons: Buttons = Buttons()
    public var font: Font = Font()

    public init() {}
    
    public struct Margin {
        public var extraExtraSmall = 4.0
        public var extraSmall = 8.0
        public var small = 12.0
        public var standard = 20.0
        public var large = 32.0
        public var extraLarge = 40.0
        public var extraExtraLarge = 48.0

        public init() {}
    }
    
    public struct Text {
        public var alertDismissText: String = "Okay"
        public var confirmCancelText: String = "Cancel"
        public var confirmConfirmationText: String = "Confirm"

        public init() {}
    }
    
    public struct Color {
        public var primary = .systemBlue
        public var secondary = .systemRed
        public var textPrimary = .darkText
        public var textSecondary = .lightText
        public var container = .gray
        public var containerLight = .lightGray
        public var outline = .separator
        public var onPrimary = .white
        public var onSecondary = .white
        public var surface = .white
        public var error = .systemRed

        public init() {}
    }
    
    public struct Buttons {
        public var primary = ButtonAppearance.defaultPrimaryConfiguration()
        public var secondary = ButtonAppearance.defaultSecondaryConfiguration()
        public var tertiary = ButtonAppearance.defaultTertiaryConfiguration()
        public var outline = ButtonAppearance.defaultOutlineConfiguration()

        public init() {}
    }
    
    public struct Font {
        public var largeTitle: UIFont = UIFont.systemFont(ofSize: 32.0, weight: .regular)
        public var title1: UIFont = UIFont.systemFont(ofSize: 28.0, weight: .regular)
        public var title2: UIFont = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        public var title3: UIFont = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        public var headline: UIFont = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        public var body: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        public var callout: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        public var subheadline: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        public var footnote: UIFont = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        public var caption1: UIFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        public var caption2: UIFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)

        public init() {}
    }
    
}
