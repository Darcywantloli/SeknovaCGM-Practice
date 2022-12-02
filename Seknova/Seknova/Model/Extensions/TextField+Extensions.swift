//
//  TextField+Extensions.swift
//  Seknova
//
//  Created by imac on 2022/10/27.
//

import UIKit

extension UITextField {
    
    func setTextFieldLeftImage(name: String,
                               x: Int,
                               y: Int,
                               width: Int,
                               height: Int) {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleAspectFit
        
        let imageContainerView = UIView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: width * 9 / 5,
                                                      height: height * 2))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
    }
    
    func setBorderBottom() {
        self.borderStyle = .none
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.navigationBar?.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 0
    }
}
