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
    
    let baseBackgroundColor: UIColor?
    let baseForegroundColor: UIColor
    let font: UIFont
    
    static func defaultPrimaryConfiguration() -> ButtonAppearance {
        return ButtonAppearance(
            baseBackgroundColor: SC.appearance.color.primary,
            baseForegroundColor: SC.appearance.color.onPrimary,
            font: SC.appearance.font.callout
        )
    }
    
    static func defaultSecondaryConfiguration() -> ButtonAppearance {
        return ButtonAppearance(
            baseBackgroundColor: SC.appearance.color.secondary,
            baseForegroundColor: SC.appearance.color.onSecondary,
            font: SC.appearance.font.callout
        )
    }
    
    static func defaultTertiaryConfiguration() -> ButtonAppearance {
        return ButtonAppearance(
            baseBackgroundColor: SC.appearance.color.container,
            baseForegroundColor: SC.appearance.color.textPrimary,
            font: SC.appearance.font.callout
        )
    }
    
    static func defaultOutlineConfiguration() -> ButtonAppearance {
        return ButtonAppearance(
            baseBackgroundColor: nil,
            baseForegroundColor: SC.appearance.color.primary,
            font: SC.appearance.font.callout
        )
    }
    
}
