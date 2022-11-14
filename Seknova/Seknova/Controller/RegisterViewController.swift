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
    
    @IBOutlet weak var registerAccountENLabel: UILabel!
    @IBOutlet weak var registerAccountCNLabel: UILabel!
    
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
        
        // 標題
        self.title = "Register"
        
        accountTextField.delegate = self
        passwordTextField.delegate = self
        enterPasswordAgainTextField.delegate = self
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        
        // TextField圖片
        let height = UIScreen.main.bounds.height * 0.25 * 0.333
        
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
        enterPasswordAgainTextField.setTextFieldLeftImage(name: "password",
                                                          x: Int(height/6),
                                                          y: Int(height/6),
                                                          width: Int(height/3),
                                                          height: Int(height/3))
        
        //選擇國籍功能
        countryTextField.text = choosedCountry
        countryTextField.layer.borderWidth = 2
        countryTextField.layer.borderColor = UIColor.navigationBar?.cgColor
        countryPickerView.backgroundColor = .white
        
        let doneButton = UIBarButtonItem(title: "完成",
                                         style: UIBarButtonItem.Style.done,
                                         target: self,
                                         action: #selector(self.disMissKeyBoard))
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                    target: nil,
                                    action: nil)
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        toolBar.barTintColor = .white
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        countryTextField.inputView = countryPickerView
        countryTextField.inputAccessoryView = toolBar
        
        //是否同意條款
        agreeButton.backgroundColor = .white
        agreeButton.layer.cornerRadius = agreeButton.frame.height / 2
        
        //註冊按鈕
        setUpButton(button: registerButton)
    }
    
// MARK: - UI Settings
    @objc func disMissKeyBoard(){
        self.view.endEditing(true)
        
        countryTextField.text = choosedCountry
    }
    
// MARK: - IBAction
    @IBAction func agreeTermsOrNot(_ sender: Any) {
        agreeOrNot = !agreeOrNot
        
        if agreeOrNot {
            agreeButton.backgroundColor = .red
        } else {
            agreeButton.backgroundColor = .white
        }
    }
    
    @IBAction func registerAccount(_ sender: Any) {
        self.navigationController?.pushViewController(VerifyViewController(), animated: true)
    }
}

// MARK: - Extensions
extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countrys.count
    }
    
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

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

// MARK: - Protocol
    
