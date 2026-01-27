//
//  Constants.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

public struct ScaffoldAppearance {
    
    public var margin: Margin = Margin()
    public var text: Text = Text()
    public var color: Color = Color()
    
    public struct Margin {
        public var extraExtraSmall = 4.0
        public var extraSmall = 8.0
        public var small = 12.0
        public var standard = 20.0
        public var large = 32.0
        public var extraLarge = 40.0
        public var extraExtraLarge = 48.0
    }
    
    public struct Text {
        public var alertDismissText: String = "Okay"
        public var confirmCancelText: String = "Cancel"
        public var confirmConfirmationText: String = "Confirm"
    }
    
    public struct Color {
        public var primary = UIColor.systemBlue
        public var secondary = UIColor.systemRed
        public var textPrimary = UIColor.darkText
        public var textSecondary = UIColor.lightText
        public var container = UIColor.gray
        public var containerLight = UIColor.lightGray
        public var outline = UIColor.separator
        public var onPrimary = UIColor.white
        public var surface = UIColor.white
        public var error = UIColor.systemRed
    }
    
}
