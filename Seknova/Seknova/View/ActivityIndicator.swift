//
//  ActivityIndicator.swift
//  Seknova
//
//  Created by imac on 2022/12/1.
//

import UIKit

func activityIndicator(center: CGPoint) -> UIActivityIndicatorView {
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    activityIndicatorView.backgroundColor = .lightGray
    activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    activityIndicatorView.layer.cornerRadius = activityIndicatorView.frame.height / 4
    activityIndicatorView.center = center
    
    return activityIndicatorView
}
