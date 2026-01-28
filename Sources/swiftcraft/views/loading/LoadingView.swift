//
//  LoadingView.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

class LoadingView: UIView {
    
    private let activityIndicatorContainerViewSize: CGFloat = 88.0
    private let containerViewCornerRadius = 7.0
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView()
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.color = UIColor.white
        return aiv
    }()
    
    private let activityIndicatorContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Unavailable")
    }
    
    private func initUI() {
        addSubview(activityIndicatorContainerView)
        activityIndicatorContainerView.addSubview(activityIndicatorView)
        
        activityIndicatorView.startAnimating()
        
        activityIndicatorContainerView.layer.cornerRadius = containerViewCornerRadius
        
        NSLayoutConstraint.activate([
            activityIndicatorContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            activityIndicatorContainerView.heightAnchor.constraint(equalToConstant: activityIndicatorContainerViewSize),
            activityIndicatorContainerView.widthAnchor.constraint(equalToConstant: activityIndicatorContainerViewSize),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: activityIndicatorContainerView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: activityIndicatorContainerView.centerYAnchor),
        ])
    }
    
}
