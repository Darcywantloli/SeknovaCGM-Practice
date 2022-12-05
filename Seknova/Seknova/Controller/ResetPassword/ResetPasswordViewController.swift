//
//  ResetPasswordViewController.swift
//  Seknova
//
//  Created by imac on 2022/11/25.
//

import UIKit

class ResetPasswordViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var bachgroundImageView: UIImageView!
    
    @IBOutlet weak var titleENLabel: UILabel!
    @IBOutlet weak var titleCNLabel: UILabel!
    
    @IBOutlet weak var oldView: UIView!
    @IBOutlet weak var oldImageView: UIImageView!
    @IBOutlet weak var oldAccountTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    
    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordCheckTextField: UITextField!
    
    @IBOutlet weak var sendOutButton: UIButton!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupLabel()
        setupButton()
        setupTextField()
    }
    
    private func setupLabel() {
        titleENLabel.text = "RESET PASSWORD"
        titleCNLabel.text = "重 置 密 碼"
    }
    
    private func setupButton() {
        sendOutButton.setTitle("送出", for: .normal)
    }
    
    private func setupTextField() {
        let height = oldAccountTextField.frame.height
        
        oldAccountTextField.setTextFieldLeftImage(name: "mail",
                                                  x: Int(height / 4),
                                                  y: Int(height / 4),
                                                  width: Int(height / 2),
                                                  height: Int(height / 2))
        oldPasswordTextField.setTextFieldLeftImage(name: "password",
                                                   x: Int(height / 4),
                                                   y: Int(height / 4),
                                                   width: Int(height / 2),
                                                   height: Int(height / 2))
        newPasswordTextField.setTextFieldLeftImage(name: "password",
                                                   x: Int(height / 4),
                                                   y: Int(height / 4),
                                                   width: Int(height / 2),
                                                   height: Int(height / 2))
        newPasswordCheckTextField.setTextFieldLeftImage(name: "password",
                                                        x: Int(height / 4),
                                                        y: Int(height / 4),
                                                        width: Int(height / 2),
                                                        height: Int(height / 2))
        
        oldAccountTextField.isEnabled = false
        oldAccountTextField.text = UserPreference.shared.email
        
        oldPasswordTextField.placeholder = "舊密碼"
        newPasswordTextField.placeholder = "請輸入新密碼"
        newPasswordCheckTextField.placeholder = "再一次輸入密碼"
    }
    
    // MARK: - IBAction
    
    @IBAction func sendOut(_ sender: Any) {
        var errorMeaasge = ""
        
        // 錯誤判斷
        if oldPasswordTextField.text != UserPreference.shared.password {
            errorMeaasge += "舊密碼輸入錯誤，請重新輸入\n"
        }
        if newPasswordTextField.text?.regularExpression(type: .password) == false {
            errorMeaasge += "密碼格式不符，請重新輸入\n"
        }
        if newPasswordCheckTextField.text != newPasswordTextField.text {
            errorMeaasge += "密碼不符，請再次確認\n"
        }
        
        if errorMeaasge == "" {
            
            // 儲存新密碼並跳回登入畫面
            UserPreference.shared.password = newPasswordTextField.text!
            
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        } else {
            
            // 推送錯誤訊息
            errorMeaasge.removeLast()
            
            Alert.showAlertWith(title: "錯誤", message: errorMeaasge, vc: self, confirmTitle: "確認")
            
            oldPasswordTextField.text = ""
            newPasswordTextField.text = ""
            newPasswordCheckTextField.text = ""
        }
    }
}

    // MARK: - Extension

    // MARK: - Protocol
