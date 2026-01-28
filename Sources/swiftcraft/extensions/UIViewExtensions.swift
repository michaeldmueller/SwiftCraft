//
//  UIViewExtensions.swift
//  SwiftCraft
//
//  Created by Michael Mueller on 1/27/26.
//

import UIKit

extension UIView {
    
    func addShadow(
        offset: CGFloat = 1,
        radius: CGFloat = 8,
        opacity: Float = 0.15,
        isInitiallyHidden: Bool = false
    ) {
        layer.shadowColor = isInitiallyHidden
            ? UIColor.clear.cgColor : UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: offset)
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
    func hideShadow() {
        layer.shadowColor = UIColor.clear.cgColor
    }
    
    func showShadow() {
        layer.shadowColor = UIColor.black.cgColor
    }
    
    func removeShadow() {
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0
    }
    
}
