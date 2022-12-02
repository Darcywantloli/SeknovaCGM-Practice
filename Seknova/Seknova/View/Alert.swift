//
//  Alert.swift
//  Seknova
//
//  Created by imac on 2022/11/28.
//

import UIKit

class Alert {
    static func showAlertWith (title: String,
                               message: String,
                               vc: UIViewController,
                               confirmTitle: String,
                               confirm: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
            let alertAction = UIAlertAction(title: confirmTitle,
                                       style: .default) { action in confirm?() }
            
            alertController.addAction(alertAction)
            vc.present(alertController, animated: true)
        }
    }
}
