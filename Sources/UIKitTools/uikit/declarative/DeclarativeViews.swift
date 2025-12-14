//
//  DeclarativeViews.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

public enum ScaffoldKit {
    
    public static func stackView(
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        spacing: Double = Constants.smallMargin,
        arrangedSubviews: UIView...
    ) -> UIStackView {
        return stackView(
            axis: axis,
            distribution: distribution,
            alignment: alignment,
            spacing: spacing,
            arrangedSubviews: arrangedSubviews
        )
    }

    public static func stackView(
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        spacing: Double = Constants.smallMargin,
        arrangedSubviews: [UIView] = []
    ) -> UIStackView {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
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
        backgroundColor: UIColor = AppColor.outline,
        height: CGFloat = Constants.separatorHeight
    ) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = backgroundColor
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: height),
        ])
        
        return view
    }
    
    public static func symbolImageView(
        image: UIImage?,
        tintColor: UIColor = UIColor.black
    ) -> UIImageView {
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = tintColor
        return iv
    }
    
    public static func label(
        text: String? = nil,
        font: UIFont = UIFont.scalingFont(forTextStyle: .body),
        textColor: UIColor = AppColor.textPrimary,
        textAlignment: NSTextAlignment = NSTextAlignment.left,
        numberOfLines: Int = 1
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        
        return label
    }
    
    public static func view() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
}
