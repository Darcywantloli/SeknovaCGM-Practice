//
//  LoginViewController.swift
//  Seknova
//
//  Created by imac on 2022/10/6.
//

import UIKit

class LoginViewController: BaseViewController {
    
// MARK: - IBOutlet
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var sekNovaImageView: UIImageView!
    
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var textFieldImageView: UIImageView!
    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var facebookLoginView: UIView!
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var facebookLoginImageView: UIImageView!
    @IBOutlet weak var facebookLoginLabel: UILabel!
    
    @IBOutlet weak var signInWithAppleView: UIView!
    @IBOutlet weak var signInWithAppleButton: UIButton!
    @IBOutlet weak var signInWithAppleImageView: UIImageView!
    @IBOutlet weak var signInWithAppleLabel: UILabel!
    
    @IBOutlet weak var googleLoginView: UIView!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var googleLoginImageView: UIImageView!
    @IBOutlet weak var googleLoginLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
// MARK: - Variables
    
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 標題
        self.title = "Login"
        
        // 按鈕樣式
        setUpButton(button: loginButton)
        setUpButton(button: registerButton)
        setUpButton(button: forgotPasswordButton)
        setUpButton(button: facebookLoginButton, borderWidth: 0)
        setUpButton(button: signInWithAppleButton, borderWidth: 0)
        setUpButton(button: googleLoginButton, borderWidth: 1, borderColor: .black)
        
        let height = UIScreen.main.bounds.height * 0.065
        
        accountTextField.setTextFieldLeftImage(name: "mail",
                                               x: Int(height/6),
                                               y: Int(height/6),
                                               width: Int(height/3),
                                               height: Int(height/3))
        passwordTextField.setTextFieldLeftImage(name: "password",
                                                x: Int(height/6),
                                                y: Int(height/6),
                                                width: Int(height/3),
                                                height: Int(height/3))
    }
    
// MARK: - UI Settings
    
// MARK: - IBAction
    // 跳轉到註冊畫面
    @IBAction func registerAccount(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}

// MARK: - Extensions

// MARK: - Protocol
