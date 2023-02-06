//
//  BloodSugarCorrectionViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit

class BloodSugarCorrectionViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var knowMoreButton: UIButton!
    @IBOutlet weak var setUpButton: UIButton!
    @IBOutlet weak var setDownButton: UIButton!
    
    @IBOutlet weak var componentLabel: UILabel!
    
    @IBOutlet weak var bloodSugarTextField: UITextField!
    
    // MARK: - Variables
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupView()
        setupButton()
        setupTextField()
        setupLongPress()
    }
    
    private func setupView() {
        self.view.insertSubview(Background(imageName: "Background5", alpha: 0.25), at: 0)
    }
    
    private func setupLongPress() {
        let longPress = UILongPressGestureRecognizer(target: self,
                                                     action: #selector(setBloodSugarUp))
        longPress.minimumPressDuration = 0.2
        longPress.numberOfTapsRequired = 1
        longPress.numberOfTouchesRequired = 1
        setUpButton.addGestureRecognizer(longPress)
    }
    
    private func setupButton() {
        saveButton.setTitle("儲存", for: .normal)
        knowMoreButton.setTitle("了解更多", for: .normal)
    }
    
    private func setupTextField() {
        bloodSugarTextField.text = "225"
        bloodSugarTextField.delegate = self
        bloodSugarTextField.keyboardType = .numberPad
    }
    
    // MARK: - IBAction
    
    @IBAction func knowMore(_ sender: Any) {
        let popupVC = KnowMoreViewController()
        let popWidth = view.bounds.width
        
        popupVC.root = .BloodSugarCorrectionViewController
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = knowMoreButton
        popupVC.popoverPresentationController?.sourceRect = knowMoreButton.bounds
        popupVC.preferredContentSize = CGSize(width: popWidth, height: 160)
        
        present(popupVC, animated: true)
    }
    
    @IBAction func saveData(_ sender: Any) {
        let nextVC = BloodSugarCheckViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func setUpBloodSugar(_ sender: Any) {
        
        
                
        var bloodSugar = bloodSugarTextField.text!
        
        if Int(bloodSugar)! < 400 {
            bloodSugar = String(Int(bloodSugar)! + 1)
            bloodSugarTextField.text = bloodSugar
        }
    }
    
    @IBAction func setDownBloodSugar(_ sender: Any) {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(setBloodSugarUp))

        setDownButton.addGestureRecognizer(longPress)
        
        var bloodSugar = bloodSugarTextField.text!
        
        if Int(bloodSugar)! > 50 {
            bloodSugar = String(Int(bloodSugar)! - 1)
            bloodSugarTextField.text = bloodSugar
        }
    }
    
    @objc func setBloodSugarUp(_ sender: UILongPressGestureRecognizer) {
        var bloodSugar = bloodSugarTextField.text!
        switch sender.state {
        case .began:
            print("press began")
        case .ended:
            print("press ended")
        case .changed:
            if Int(bloodSugar)! < 400 {
                bloodSugar = String(Int(bloodSugar)! + 1)
                bloodSugarTextField.text = bloodSugar
            }
            print("press changed")
        case .cancelled:
            print("press cancelled")
        case .failed:
            print("press failed")
        case .possible:
            print("press possible")
        default:
            print("press default")
        }
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension BloodSugarCorrectionViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController,
                                   traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

extension BloodSugarCorrectionViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if Int(textField.text!)! > 400 || Int(textField.text!)! < 50 {
            Alert.showAlertWith(title: "錯誤", message: "輸入範圍為50~400", vc: self, confirmTitle: "確認")
            textField.text = "225"
        }
    }
}

// MARK: - Protocol
