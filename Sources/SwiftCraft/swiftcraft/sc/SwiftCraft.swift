//
//  DeclarativeViews.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

public enum SC {
    
    private static var _appearance = SCAppearance()
    
    public static var appearance: SCAppearance {
        get { _appearance }
        set { _appearance = newValue }
    }        
    
}
