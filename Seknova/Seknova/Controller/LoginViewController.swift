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
    
    var account: String = UserPreference.shared.email
    var password: String = UserPreference.shared.password
    var firstLogin: Bool = UserPreference.shared.firstLogin
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        print(account, password, firstLogin)
        if firstLogin {
            accountTextField.text = account
            UserPreference.shared.firstLogin = false
        }
        print(account, password, firstLogin)
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupButton()
        setupTextField()
    }
    
    private func setupButton() {
        // 按鈕樣式
        loginButton.setTitle("登入", for: .normal)
        registerButton.setTitle("註冊", for: .normal)
        forgotPasswordButton.setTitle("忘記密碼", for: .normal)
        
        facebookLoginLabel.text = "Facebook 登入"
        signInWithAppleLabel.text = "使用 Apple 登入"
        googleLoginLabel.text = "Google 登入"
    }
    
    private func setupTextField() {
        let height = UIScreen.main.bounds.height * 0.065
        
        accountTextField.setTextFieldLeftImage(name: "mail",
                                               x: Int(height/6),
                                               y: Int(height/6),
                                               width: Int(height/3),
                                               height: Int(height/3))
        accountTextField.placeholder = "帳號"
        
        passwordTextField.setTextFieldLeftImage(name: "password",
                                                x: Int(height/6),
                                                y: Int(height/6),
                                                width: Int(height/3),
                                                height: Int(height/3))
        passwordTextField.placeholder = "密碼"
        
        print(account, password, firstLogin)
        if firstLogin {
            accountTextField.text = account
            UserPreference.shared.firstLogin = false
        }
        print(account, password, firstLogin)
    }
    
    func finishRegister(autoLogin: Bool) {
        if autoLogin {
            accountTextField.text = account
        } else {
            accountTextField.text = ""
        }
    }
    
    // MARK: - IBAction
    
    // 跳轉到註冊畫面
    @IBAction func registerAccount(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}

// MARK: - Extensions

// MARK: - Protocol
