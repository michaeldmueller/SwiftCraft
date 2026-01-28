//
//  Buttons.swift
//  SwiftCraft
//
//  Created by Michael Mueller on 1/27/26.
//

import UIKit

extension SC {
            
    public static func primaryButton(
        title: String,
        image: SCButton.ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.primary
        
        button.configuration = filledConfiguration(with: appearance)
        
        return button
    }
    
    public static func secondaryButton(
        title: String,
        image: SCButton.ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.secondary
        
        button.configuration = filledConfiguration(with: appearance)
        
        return button
    }
    
    public static func tertiaryButton(
        title: String,
        image: SCButton.ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.tertiary
        
        button.configuration = filledConfiguration(with: appearance)
        
        return button
    }
    
    public static func borderedButton(
        title: String,
        image: SCButton.ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.outline
        
        button.configuration = borderedConfiguration(with: appearance)
        
        return button
    }
    
    private static func filledConfiguration(with appearance: ButtonAppearance) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = appearance.baseBackgroundColor
        configuration.baseForegroundColor = appearance.baseForegroundColor
        configuration.cornerStyle = appearance.cornerStyle
        if (configuration.cornerStyle == .fixed) {
            configuration.background.cornerRadius = appearance.cornerRadius
        }
        configuration.titleTextAttributesTransformer = .init { attributes in
            var modifiableAttributes = attributes
            modifiableAttributes.font = appearance.font
            return modifiableAttributes
        }
        return configuration
    }
    
    private static func borderedConfiguration(with appearance: ButtonAppearance) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.bordered()
        configuration.baseBackgroundColor = appearance.baseBackgroundColor
        configuration.baseForegroundColor = appearance.baseForegroundColor
        configuration.cornerStyle = appearance.cornerStyle
        if (configuration.cornerStyle == .fixed) {
            configuration.background.cornerRadius = appearance.cornerRadius
        }
        configuration.titleTextAttributesTransformer = .init { attributes in
            var modifiableAttributes = attributes
            modifiableAttributes.font = appearance.font
            return modifiableAttributes
        }
        return configuration
    }
            
}

public class SCButton: UIButton {
    
    public struct ButtonImage {
        let image: UIImage
        let imagePadding: CGFloat
        let imagePlacement: NSDirectionalRectEdge
        let symbolPointSize: CGFloat
        
        init(
            image: UIImage,
            imagePadding: CGFloat = 8.0,
            imagePlacement: NSDirectionalRectEdge = .leading,
            symbolPointSize: CGFloat = 14.0
        ) {
            self.image = image
            self.imagePadding = imagePadding
            self.imagePlacement = imagePlacement
            self.symbolPointSize = symbolPointSize
        }
    }
    
}

public struct ButtonAppearance {

    public var baseBackgroundColor: UIColor? = .systemBlue
    public var baseForegroundColor: UIColor = .white
    public var font: UIFont = .systemFont(ofSize: 15.0, weight: .regular)
    public var cornerStyle: UIButton.Configuration.CornerStyle = .fixed
    public var cornerRadius: CGFloat = 8.0

    public init() {}

    static func defaultPrimaryConfiguration() -> ButtonAppearance {
        return ButtonAppearance()
    }

    static func defaultSecondaryConfiguration() -> ButtonAppearance {
        var secondary = ButtonAppearance()
        secondary.baseBackgroundColor = .systemRed
        secondary.baseForegroundColor = .white
        return secondary
    }

    static func defaultTertiaryConfiguration() -> ButtonAppearance {
        var tertiary = ButtonAppearance()
        tertiary.baseBackgroundColor = .gray
        tertiary.baseForegroundColor = .darkText
        return tertiary
    }

    static func defaultOutlineConfiguration() -> ButtonAppearance {
        var outline = ButtonAppearance()
        outline.baseBackgroundColor = nil
        outline.baseForegroundColor = .systemBlue
        return outline
    }

}
