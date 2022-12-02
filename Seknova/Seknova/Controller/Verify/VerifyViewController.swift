//
//  VerifyViewController.swift
//  Seknova
//
//  Created by imac on 2022/11/14.
//

import UIKit

class VerifyViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var activatedAccountENLabel: UILabel!
    @IBOutlet weak var activatedAccountCNLabel: UILabel!
    
    @IBOutlet weak var checkEmailLabel: UILabel!

    @IBOutlet weak var sendAgainButton: UIButton!
    @IBOutlet weak var nextStepButton: UIButton!
    
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
    }
    
    private func setupLabel() {
        activatedAccountENLabel.text = "Activated Account"
        activatedAccountCNLabel.text = "開 通 帳 號"
        
        checkEmailLabel.text = "請到信箱點選認證信開通帳號"
    }
    
    private func setupButton() {
        sendAgainButton.setTitle("重送驗證信", for: .normal)
        nextStepButton.setTitle("下一步", for: .normal)
    }
    
    // MARK: - IBAction

    // 清除返回按鈕
    @IBAction func nextStep(_ sender: Any) {
        if let navigationController = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?
            .rootViewController as? UINavigationController {
            navigationController.pushViewController(LoginViewController(), animated: true)
        }
    }
}

    // MARK: - Extensions

    // MARK: - Protocol
