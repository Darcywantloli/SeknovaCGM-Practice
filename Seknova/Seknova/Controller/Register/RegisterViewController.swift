//
//  RegisterViewController.swift
//  Seknova
//
//  Created by imac on 2022/10/26.
//

import UIKit

class RegisterViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var bachgroundImageView: UIImageView!
    
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var titleENLabel: UILabel!
    @IBOutlet weak var titleCNLabel: UILabel!
    
    @IBOutlet weak var textFieldStackView: UIStackView!
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterPasswordAgainTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var termsLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Variables
    
    var countryPickerView = UIPickerView()
    var toolBar = UIToolbar()
    var countrys = ["Taiwan (台灣)", "USA (美國)"]
    var choosedCountry = "Taiwan (台灣)"
    var agreeOrNot = false
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register" // 標題
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupLabel()
        setupButton()
        setupToolBar()
        setupTextField()
        setupPickerView()
    }
    
    private func setupLabel() {
        titleENLabel.text = "REGISTER ACCOUNT"
        titleCNLabel.text = "註 冊 帳 號"
        
        // 特定範圍文字可互動
        let text = "我已閱讀並同意會員協議的條款和條件。"
        let termsAndConditions = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "條款和條件")
        
        termsAndConditions.addAttribute(NSAttributedString.Key.foregroundColor,
                                        value: UIColor.tintColor,
                                        range: range)
        
        termsLabel.attributedText = termsAndConditions
        termsLabel.isUserInteractionEnabled = true
        termsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                               action: #selector(checkTermsAndConditions)))
    }
    
    private func setupButton() {
        agreeButton.backgroundColor = .white
        agreeButton.layer.cornerRadius = agreeButton.frame.height / 2
        
        registerButton.setTitle("註冊", for: .normal)
    }
    
    private func setupToolBar() {
        let doneButton = UIBarButtonItem(title: "完成",
                                         style: .done,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil)
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        toolBar.barTintColor = .white
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    private func setupTextField() {
        accountTextField.placeholder = "電子郵件"
        passwordTextField.placeholder = "密碼(8到16字元，須包含大小寫及數字)"
        enterPasswordAgainTextField.placeholder = "再一次輸入密碼"
        
        // TextField左側圖片
        let height = accountTextField.frame.height
        
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
        
        // 選擇國籍
        countryTextField.text = choosedCountry
        countryTextField.inputView = countryPickerView
        countryTextField.inputAccessoryView = toolBar
    }
    
    private func setupPickerView() {
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        countryPickerView.backgroundColor = .white
    }
    
    // 收起鍵盤
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
        countryTextField.text = choosedCountry
    }
 
    // 彈出同意書畫面
    @objc func checkTermsAndConditions() {
        let popupVC = AgreementViewController()
        let popWidth = self.view.bounds.width
        let popHeight = self.view.bounds.height
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height
        
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = navigationController?.navigationBar
        popupVC.popoverPresentationController?.sourceRect = CGRect(x: 0,
                                                                   y: 0,
                                                                   width: popWidth,
                                                                   height: navigationBarHeight!)
        popupVC.preferredContentSize = CGSize(width: popWidth, height: popHeight)

        present(popupVC, animated: true)
    }

    // MARK: - IBAction
    
    // 是否勾選
    @IBAction func agreeTermsOrNot(_ sender: Any) {
        agreeOrNot = !agreeOrNot
        
        if agreeOrNot {
            agreeButton.backgroundColor = .systemBlue
        } else {
            agreeButton.backgroundColor = .white
        }
    }
    
    // 註冊按鈕功能
    @IBAction func registerAccount(_ sender: Any) {
        var errorMeaasge = ""
        
        // 正則判斷
        if accountTextField.text?.regularExpression(type: .email) == false {
            errorMeaasge += "帳號格式不符，請重新輸入\n"
        }
        if passwordTextField.text?.regularExpression(type: .password) == false {
            errorMeaasge += "密碼格式不符，請重新輸入\n"
        }
        if enterPasswordAgainTextField.text != passwordTextField.text {
            errorMeaasge += "密碼不符，請再次確認\n"
        }
        if agreeOrNot == false {
            errorMeaasge += "未勾選同意書\n"
        }
        
        if errorMeaasge == "" {
            
            // 儲存帳號並跳轉至驗證畫面
            UserPreference.shared.email = accountTextField.text!
            UserPreference.shared.password = passwordTextField.text!
            UserPreference.shared.firstLogin = true
            
            self.navigationController?.pushViewController(VerifyViewController(), animated: true)
        } else {
            
            // 推送錯誤訊息
            errorMeaasge.removeLast()
            
            Alert.showAlertWith(title: "錯誤", message: errorMeaasge, vc: self, confirmTitle: "確認")
            
            accountTextField.text = ""
            passwordTextField.text = ""
            enterPasswordAgainTextField.text = ""
        }
    }
}

    // MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countrys.count
    }
    
    // UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return countrys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        choosedCountry = countrys[row]
    }
}

    // MARK: - UIPopoverPresentationControllerDelegate

extension RegisterViewController: UIPopoverPresentationControllerDelegate {
    
    // UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController,
                                   traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

    // MARK: - Protocol
