//
//  ForgotPasswordViewController.swift
//  Seknova
//
//  Created by imac on 2022/11/25.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var titleENLabel: UILabel!
    @IBOutlet weak var titleCNLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var enterEmailView: UIView!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var enterEmailTextField: UITextField!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings

    func setupUI() {
        setupView()
        setupLabel()
        setupButton()
        setupTextField()
    }
    
    private func setupView() {
        enterEmailView.layer.shadowOpacity = 0.5
        enterEmailView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    private func setupLabel() {
        titleENLabel.text = "FORGOT PASSWORD"
        titleCNLabel.text = "忘 記 密 碼"
        
        enterEmailLabel.text = "請輸入您的Email"
    }
    
    private func setupButton() {
        sendButton.setTitle("送出", for: .normal)
    }
    
    private func setupTextField() {
        enterEmailTextField.setBorderBottom()
    }
    
    // MARK: - IBAction
    
    // 帳號判斷
    @IBAction func sendOut(_ sender: Any) {
        if enterEmailTextField.text == "" {
            Alert.showAlertWith(title: "錯誤",
                                message: "請輸入正確的郵箱",
                                vc: self,
                                confirmTitle: "確認")
        }
        
        if enterEmailTextField.text?.regularExpression(type: .email) == true {
            self.navigationController?.pushViewController(ResetPasswordViewController(),
                                                          animated: true)
        } else {
            Alert.showAlertWith(title: "錯誤",
                                message: "請輸入正確的郵箱",
                                vc: self,
                                confirmTitle: "確認")
        }
    }
}

    // MARK: - Extension

    // MARK: - Protocol
