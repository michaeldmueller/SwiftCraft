//
//  AlertService.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/3/25.
//

import UIKit

extension SC {
    
    public static func alert(
        title: String,
        message: String,
        presenter: UIViewController,
        buttonText: String? = nil,
        completion: (() -> Void)? = nil
    ) {
        MainThread.run {
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert
            )
            
            let actions = [
                UIAlertAction(
                    title: buttonText ?? SC.appearance.text.alertDismissText,
                    style: UIAlertAction.Style.default
                ) { action in
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            ]
            
            actions.forEach {
                alert.addAction($0)
            }
            
            presenter.present(
                alert,
                animated: true,
                completion: nil
            )
        }
    }
    
    public static func confirm(
        title: String,
        message: String,
        cancelText: String? = nil,
        confirmationText: String? = nil,
        presenter: UIViewController,
        positiveCompletion: (() -> Void)?,
        cancelCompletion: (() -> Void)?
    ) {
        MainThread.run {
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert
            )
            
            let actions = [
                UIAlertAction(
                    title: cancelText ?? SC.appearance.text.confirmCancelText,
                    style: UIAlertAction.Style.cancel
                ) { action in
                    cancelCompletion?()
                },
                UIAlertAction(
                    title: confirmationText ?? SC.appearance.text.confirmConfirmationText,
                    style: UIAlertAction.Style.default
                ) { action in
                    positiveCompletion?()
                }
            ]
            
            actions.forEach {
                alert.addAction($0)
            }
            
            presenter.present(
                alert,
                animated: true,
                completion: nil
            )
        }
    }
    
    public static func actionSheet(
        title: String,
        message: String,
        actions: [UIAlertAction],
        presenter: UIViewController
    ) {
        MainThread.run {
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.actionSheet
            )
            
            actions.forEach {
                alert.addAction($0)
            }

            presenter.present(
                alert,
                animated: true,
                completion: nil
            )
        }
    }    
    
}
