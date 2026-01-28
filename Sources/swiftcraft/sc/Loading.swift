//
//  LoadingService.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

extension SC {
    
    static private let loadingView = LoadingView()
    
    @MainActor
    public static func startLoading(
        parent: UIViewController,
        isTransparent: Bool = true,
        durationMillis: Double? = nil
    ) {
        DispatchQueue.main.async {
            loadingView.frame = parent.view.bounds
            loadingView.backgroundColor = isTransparent ? UIColor.clear : UIColor.white
            loadingView.removeFromSuperview()
            parent.view.addSubview(loadingView)
        }
        if let durationMillis {
            DispatchQueue.main.asyncAfter(deadline: .now() + (durationMillis / 1000)) {
                loadingView.removeFromSuperview()
            }
        }
    }
    
    @MainActor
    public static func stopLoading() {
        DispatchQueue.main.async {
            loadingView.removeFromSuperview()
        }
    }
    
    @MainActor
    public static func stopLoading(afterMillis: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + (afterMillis / 1000)) {
            loadingView.removeFromSuperview()
        }
    }
    
}

