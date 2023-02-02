//
//  Background.swift
//  Seknova
//
//  Created by imac on 2023/1/17.
//

import UIKit

class Background: UIView {
    
    // MARK: - Variables
    
    let screenSize = UIScreen.main.bounds.size
    
    var imageView: UIImageView!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        
    }
    
    init(imageName: String, alpha: CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        self.imageView = UIImageView(image: UIImage(named: imageName))
        self.imageView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.alpha = alpha
        self.addSubview(self.imageView)
        self.insertSubview(self.imageView, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAlphaBackground() {
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: screenSize.width,
                                 height: screenSize.height)
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.5
        self.addSubview(imageView)
        self.insertSubview(imageView, at: 0)
    }
}
