//
//  KnowMoreViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/5.
//

import UIKit

class KnowMoreViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var knowMoreScrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var manualLabel: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    // MARK: - Variables
    
    var root: LastViewController = .SetUpBloodSugerIndexViewController
    
    enum LastViewController {
        case SetUpBloodSugerIndexViewController
        case BloodSugarCorrectionViewController
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupLabel()
    }
    
    private func setupLabel() {
        switch root {
        case .SetUpBloodSugerIndexViewController:
            titleLabel.text = "設定高低血糖值"
            manualLabel.text = "系統會於血糖高於高血糖值或是血糖低於低血糖值時透過通知使用者須進一步處理。通知方式為訊息，鈴聲(可關掉)或電子郵件信箱。"
        case .BloodSugarCorrectionViewController:
            titleLabel.text = "血糖校正"
            manualLabel.text = "系統暖機完後須進行第一次血糖校正，請透過任證的血糖機量測血糖值，並將量測的血糖值輸入在血糖校正的欄位。"
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func check(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - Extension

// MARK: - Protocol
