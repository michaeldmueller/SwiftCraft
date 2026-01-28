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
        
        button.setTitle(title, for: .normal)
        
        if let height = appearance.height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return button
    }
    
    public static func secondaryButton(
        title: String,
        image: SCButton.ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.secondary
        
        button.configuration = filledConfiguration(with: appearance)
        
        button.setTitle(title, for: .normal)
        
        if let height = appearance.height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return button
    }
    
    public static func tertiaryButton(
        title: String,
        image: SCButton.ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.tertiary
        
        button.configuration = filledConfiguration(with: appearance)
        
        button.setTitle(title, for: .normal)
        
        if let height = appearance.height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return button
    }
    
    public static func borderedButton(
        title: String,
        image: SCButton.ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.outline
        
        button.configuration = borderedConfiguration(with: appearance)
        
        button.setTitle(title, for: .normal)
        
        if let height = appearance.height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
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

    public var baseBackgroundColor: UIColor?
    public var baseForegroundColor: UIColor
    public var font: UIFont
    public var cornerStyle: UIButton.Configuration.CornerStyle
    public var cornerRadius: CGFloat
    public var height: CGFloat?

    public init(
        baseBackgroundColor: UIColor? = nil,
        baseForegroundColor: UIColor = .white,
        font: UIFont = .systemFont(ofSize: 15.0, weight: .regular),
        cornerStyle: UIButton.Configuration.CornerStyle = .fixed,
        cornerRadius: CGFloat = 8.0,
        height: CGFloat? = 52.0
    ) {
        self.baseBackgroundColor = baseBackgroundColor
        self.baseForegroundColor = baseForegroundColor
        self.font = font
        self.cornerStyle = cornerStyle
        self.cornerRadius = cornerRadius
        self.height = height
    }

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
