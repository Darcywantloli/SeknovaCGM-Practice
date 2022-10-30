//
//  TextField+Extensions.swift
//  Seknova
//
//  Created by imac on 2022/10/27.
//

import UIKit

extension UITextField {
    
    func setTextFieldLeftImage(name: String, x: Int, y: Int, width: Int, height: Int) {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleAspectFit
        
        
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: width*3/2, height: height * 2))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        
    }
}
