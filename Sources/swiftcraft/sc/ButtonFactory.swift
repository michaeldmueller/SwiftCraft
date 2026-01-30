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
        image: UIImage
    ) -> UIButton {
        return primaryButton(
            title: title,
            image: image.toButtonImage()
        )
    }
            
    public static func primaryButton(
        title: String,
        image: ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.primary
        
        button.configuration = filledConfiguration(with: appearance)
        
        button.setTitle(title, for: .normal)
        
        if let image {
            button.configuration?.image = image.image
            button.configuration?.imagePadding = image.padding
            button.configuration?.imagePlacement = image.placement
            button.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(
                pointSize: image.symbolPointSize
            )
        }
        
        if let height = appearance.height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return button
    }
    
    public static func secondaryButton(
        title: String,
        image: UIImage
    ) -> UIButton {
        return secondaryButton(
            title: title,
            image: image.toButtonImage()
        )
    }
    
    public static func secondaryButton(
        title: String,
        image: ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.secondary
        
        button.configuration = filledConfiguration(with: appearance)
        
        button.setTitle(title, for: .normal)
        
        if let image {
            button.configuration?.image = image.image
            button.configuration?.imagePadding = image.padding
            button.configuration?.imagePlacement = image.placement
            button.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(
                pointSize: image.symbolPointSize
            )
        }
        
        if let height = appearance.height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return button
    }
    
    public static func tertiaryButton(
        title: String,
        image: UIImage
    ) -> UIButton {
        return tertiaryButton(
            title: title,
            image: image.toButtonImage()
        )
    }
    
    public static func tertiaryButton(
        title: String,
        image: ButtonImage? = nil
    ) -> UIButton {
        let button: UIButton = viewWithoutAutoresizing()
        let appearance = SC.appearance.buttons.tertiary
        
        button.configuration = filledConfiguration(with: appearance)
        
        button.setTitle(title, for: .normal)
        
        if let image {
            button.configuration?.image = image.image
            button.configuration?.imagePadding = image.padding
            button.configuration?.imagePlacement = image.placement
            button.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(
                pointSize: image.symbolPointSize
            )
        }
        
        if let height = appearance.height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return button
    }
    
    public static func borderedButton(
        title: String,
        image: UIImage
    ) -> UIButton {
        return borderedButton(
            title: title,
            image: image.toButtonImage()
        )
    }
    
    public static func borderedButton(
        title: String,
        image: ButtonImage? = nil
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
        configuration.applyCornerStyle(style: appearance.cornerStyle)
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
        configuration.applyCornerStyle(style: appearance.cornerStyle)
        configuration.titleTextAttributesTransformer = .init { attributes in
            var modifiableAttributes = attributes
            modifiableAttributes.font = appearance.font
            return modifiableAttributes
        }
        return configuration
    }
            
}

public struct ButtonAppearance {

    public var baseBackgroundColor: UIColor?
    public var baseForegroundColor: UIColor
    public var font: UIFont
    public var cornerStyle: CornerStyle
    public var height: CGFloat?

    public init(
        baseBackgroundColor: UIColor? = nil,
        baseForegroundColor: UIColor = .white,
        font: UIFont = .systemFont(ofSize: 15.0, weight: .regular),
        cornerStyle: CornerStyle = .capsule,
        height: CGFloat? = 52.0
    ) {
        self.baseBackgroundColor = baseBackgroundColor
        self.baseForegroundColor = baseForegroundColor
        self.font = font
        self.cornerStyle = cornerStyle
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
    
    public enum CornerStyle {
        case fixed(radius: CGFloat)
        case dynamic
        case small
        case medium
        case large
        case capsule
    }

}

private extension UIButton.Configuration {
    
    mutating func applyCornerStyle(style: ButtonAppearance.CornerStyle) {
        switch (style) {
            case .fixed(let radius):
                self.cornerStyle = .fixed
                self.background.cornerRadius = radius
            case .dynamic:
                self.cornerStyle = .dynamic
            case .small:
                self.cornerStyle = .small
            case .medium:
                self.cornerStyle = .medium
            case .large:
                self.cornerStyle = .large
            case .capsule:
                self.cornerStyle = .capsule
        }
    }
    
}

public struct ButtonImage {
    let image: UIImage
    let placement: NSDirectionalRectEdge
    let padding: CGFloat
    let symbolPointSize: CGFloat
    
    public init(
        image: UIImage,
        placement: NSDirectionalRectEdge = .leading,
        padding: CGFloat = 8.0,
        symbolPointSize: CGFloat = 14.0
    ) {
        self.image = image
        self.placement = placement
        self.padding = padding
        self.symbolPointSize = symbolPointSize
    }
}

extension Optional where Wrapped == UIImage {
    
    public func toButtonImage(
        placement: NSDirectionalRectEdge = .leading,
        padding: CGFloat = 8.0,
        symbolPointSize: CGFloat = 14.0
    ) -> ButtonImage? {
        guard self != nil else {
            return nil
        }
        return toButtonImage(
            placement: placement,
            padding: padding,
            symbolPointSize: symbolPointSize
        )
    }
    
}

extension UIImage {
    
    public func toButtonImage(
        placement: NSDirectionalRectEdge = .leading,
        padding: CGFloat = 8.0,
        symbolPointSize: CGFloat = 14.0
    ) -> ButtonImage {
        return ButtonImage(
            image: self,
            placement: placement,
            padding: padding,
            symbolPointSize: symbolPointSize
        )
    }
    
}
