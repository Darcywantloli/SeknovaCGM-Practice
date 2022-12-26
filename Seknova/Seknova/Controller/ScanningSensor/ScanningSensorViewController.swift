//
//  ScanningSensorViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/21.
//

import UIKit

class ScanningSensorViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var sensorImageView: UIImageView!
    
    @IBOutlet weak var enterWithTextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Scanning Sensor"
        self.navigationItem.hidesBackButton = true
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupButton()
    }
    
    private func setupButton() {
        enterWithTextButton.setTitle("文字輸入", for: .normal)
        backButton.setTitle("略過", for: .normal)
    }
    
    // MARK: - IBAction
    
    @IBAction func enterWithText(_ sender: Any) {
        Alert.showAlertWithTextField(title: "內容",
                                     message: "請輸入裝置碼",
                                     vc: self,
                                     confirmTitle: "確認",
                                     cancelTitle: "取消",
                                     setTextField: { textField in
            textField.placeholder = "輸入裝置碼"
        },
                                     comfirm: { textField in
            if textField.text?.regularExpression(type: .deviceID) == false {
                Alert.showAlertWith(title: "錯誤",
                                    message: "請輸入正確的裝置碼",
                                    vc: self,
                                    confirmTitle: "確認")
            } else {
                UserPreference.shared.sensorID = textField.text!
                
                let nextVC = MainViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        })
    }
    
    @IBAction func back(_ sender: Any) {
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Extension

// MARK: - Protocol
