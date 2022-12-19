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
        self.title = "Login"
        self.navigationItem.setHidesBackButton(true, animated: true)

        setupUI()
        setNavigationBar()
        
        accountTextField.text = UserPreference.shared.email
        passwordTextField.text = UserPreference.shared.password
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupButton()
        setupTextField()
    }
    
    private func setupButton() {
        loginButton.setTitle("登入", for: .normal)
        registerButton.setTitle("註冊", for: .normal)
        forgotPasswordButton.setTitle("忘記密碼", for: .normal)
        
        facebookLoginLabel.text = "Facebook 登入"
        signInWithAppleLabel.text = "使用 Apple 登入"
        googleLoginLabel.text = "Google 登入"
    }
    
    private func setupTextField() {
        let height = accountTextField.frame.height
        
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
    }
    
    // MARK: - IBAction
    
    // 登入
    @IBAction func login(_ sender: Any) {
        let indicatorView = activityIndicator(center: self.view.center)
        
        self.view.addSubview(indicatorView)
        
        if accountTextField.text == UserPreference.shared.email &&
            passwordTextField.text == UserPreference.shared.password &&
            UserPreference.shared.firstLogin == true {
            indicatorView.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                indicatorView.stopAnimating()
                UserPreference.shared.firstLogin = false
                indicatorView.removeFromSuperview()
                
                let nextVC = AgreementViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        } else if UserPreference.shared.firstLogin == false {
            indicatorView.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                indicatorView.stopAnimating()
                indicatorView.removeFromSuperview()
                
                let nextVC = GetPersonalInformationViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        } else {
            Alert.showAlertWith(title: "錯誤", message: "帳號密碼錯誤", vc: self, confirmTitle: "確認")
        }
    }
    
    // 跳轉到忘記密碼畫面
    @IBAction func forgotPassword(_ sender: Any) {
        let nextVC = ForgotPasswordViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // 跳轉到註冊畫面
    @IBAction func registerAccount(_ sender: Any) {
        let nextVC = RegisterViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Extensions

// MARK: - Protocol
