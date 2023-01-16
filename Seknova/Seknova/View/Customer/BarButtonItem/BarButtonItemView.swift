//
//  BarButtonItemView.swift
//  Seknova
//
//  Created by imac on 2022/12/26.
//

import UIKit

class BarButtonItemView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Variables
    
    var delagate: CustomButtonDelegate?
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        addXibView()
        
    }
    
    // MARK: - UI Settings
    
    func setInit(buttonTag tag: Int, text: String, image: String, delagate: CustomButtonDelegate) {
        setupLabel(text: text)
        setupButton(tag: tag)
        setupImageView(imageName: image)
        self.delagate = delagate
    }
    
    private func setupLabel(text: String) {
        label.text = text
    }
    
    private func setupButton(tag: Int) {
        button.setTitle("", for: .normal)
        button.tag = tag
    }
    
    private func setupImageView(imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
    }
    
    // MARK: - IBAction
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        delagate?.target(index: button.tag, button: button)
    }
}

// MARK: - Extensions

fileprivate extension BarButtonItemView {
    
    func addXibView() {
        if let loadView = Bundle(for: BarButtonItemView.self)
            .loadNibNamed("BarButtonItemView", owner: self, options: nil)?
            .first as? UIView {
            addSubview(loadView)
            loadView.frame = bounds
        }
    }
}

// MARK: - Protocol

protocol CustomButtonDelegate: NSObjectProtocol {
    func target(index: Int, button: UIButton)
}
