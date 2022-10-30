//
//  RegisterViewController.swift
//  Seknova
//
//  Created by imac on 2022/10/26.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var bachgroundImageView: UIImageView!
    
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var registerAccountENLabel: UILabel!
    @IBOutlet weak var registerAccountCNLabel: UILabel!
    
    @IBOutlet weak var textFieldStackView: UIStackView!
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterPasswordAgainTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 標題
        self.title = "Register"
        
        // TextField圖片
        let height = UIScreen.main.bounds.height * 0.25 * 0.333
        
        accountTextField.setTextFieldLeftImage(name: "mail",
                                               x: Int(height/4),
                                               y: Int(height/4),
                                               width: Int(height/2),
                                               height: Int(height/2))
        passwordTextField.setTextFieldLeftImage(name: "password",
                                                x: Int(height/4),
                                                y: Int(height/4),
                                                width: Int(height/2),
                                                height: Int(height/2))
        enterPasswordAgainTextField.setTextFieldLeftImage(name: "password",
                                                          x: Int(height/4),
                                                          y: Int(height/4),
                                                          width: Int(height/2),
                                                          height: Int(height/2))
        setUpButton(button: registerButton)
        
    }
}
