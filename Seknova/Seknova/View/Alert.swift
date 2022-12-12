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
    
    static func showActionSheetWith (names: [String],
                                     vc: UIViewController,
                                     confirm: ((Int) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil,
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
            
            for name in names {
                let action = UIAlertAction(title: name, style: .default) { action in
                    let index = names.firstIndex(of: name)
                    confirm?(index!)
                }
//                action.setValue(UIColor.navigationBar, forKey: "titleColor")
                alertController.addAction(action)
            }
            
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            vc.present(alertController, animated: true)
        }
    }
}
