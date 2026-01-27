//
//  ViewFactory.swift
//  SwiftCraft
//
//  Created by Michael Mueller on 1/27/26.
//

import UIKit

extension SC {
    
    public static func stackView(
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        spacing: Double = SC.appearance.margin.small,
        arrangedSubviews: [UIView] = []
    ) -> UIStackView {
        let sv: UIStackView = viewWithoutAutoresizing()

        sv.axis = axis
        sv.distribution = distribution
        sv.alignment = alignment
        sv.spacing = spacing
        
        arrangedSubviews.forEach {
            sv.addArrangedSubview($0)
        }

        return sv
    }

    public static func separator(
        backgroundColor: UIColor = SC.appearance.color.outline,
        height: CGFloat = 1.0
    ) -> UIView {
        let view: UIView = viewWithoutAutoresizing()
        
        view.backgroundColor = backgroundColor
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return view
    }

    public static func label(
        text: String? = nil,
        font: UIFont = SC.appearance.font.body,
        textColor: UIColor = SC.appearance.color.textPrimary,
        textAlignment: NSTextAlignment = NSTextAlignment.left,
        numberOfLines: Int = 1
    ) -> UILabel {
        let label: UILabel = viewWithoutAutoresizing()
        
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        
        return label
    }

    public static func imageView(
        image: UIImage?,
        tintColor: UIColor = SC.appearance.color.primary,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        height: CGFloat? = nil,
        width: CGFloat? = nil
    ) -> UIImageView {
        let iv: UIImageView = viewWithoutAutoresizing()
        
        iv.image = image
        iv.tintColor = tintColor
        iv.contentMode = contentMode
        
        if let height {
            iv.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width {
            iv.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        return iv
    }

    public static func view(
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        backgroundColor: UIColor? = nil
    ) -> UIView {
        let view: UIView = viewWithoutAutoresizing()
        
        if let height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let backgroundColor {
            view.backgroundColor = backgroundColor
        }
        
        return view
    }
    
    public static func viewWithoutAutoresizing<T: UIView>() -> T {
        let t = T()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }
    
}
