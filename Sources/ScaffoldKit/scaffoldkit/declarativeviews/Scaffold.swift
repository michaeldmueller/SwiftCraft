//
//  DeclarativeViews.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

public func stackView(
    axis: NSLayoutConstraint.Axis = .vertical,
    distribution: UIStackView.Distribution = .fill,
    alignment: UIStackView.Alignment = .fill,
    spacing: Double = Scaffold.appearance.margin.small,
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

public func separator(
    backgroundColor: UIColor = Scaffold.appearance.color.outline,
    height: CGFloat = 1.0
) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = backgroundColor
    view.heightAnchor.constraint(equalToConstant: height).isActive = true
    
    return view
}

public func label(
    text: String? = nil,
    font: UIFont = UIFont.scalingFont(forTextStyle: .body),
    textColor: UIColor = Scaffold.appearance.color.textPrimary,
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

public func imageView(
    image: UIImage?,
    tintColor: UIColor = Scaffold.appearance.color.primary,
    contentMode: UIView.ContentMode = .scaleAspectFit,
    height: CGFloat? = nil,
    width: CGFloat? = nil
) -> UIImageView {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
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

public func view(
    height: CGFloat? = nil,
    width: CGFloat? = nil,
    backgroundColor: UIColor? = nil
) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    
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
