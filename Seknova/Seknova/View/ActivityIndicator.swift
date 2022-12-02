//
//  ActivityIndicator.swift
//  Seknova
//
//  Created by imac on 2022/12/1.
//

import UIKit

func activityIndicator(style: UIActivityIndicatorView.Style = .medium,
                       frame: CGRect? = nil,
                       center: CGPoint? = nil) -> UIActivityIndicatorView {
    let activityIndicatorView = UIActivityIndicatorView(style: style)
    
    if let frame = frame {
        activityIndicatorView.frame = frame
    }
    
    if let center = center {
        activityIndicatorView.center = center
    }
    
    return activityIndicatorView
}
