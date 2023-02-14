//
//  BloodSugarCheckViewController.swift
//  Seknova
//
//  Created by imac on 2023/2/2.
//

import UIKit

class BloodSugarCheckViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var bloodSugarLabel: UILabel!
    @IBOutlet weak var componentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    
    // MARK: - Variables
    
    var bloodSugarIndex: String = ""
    
    let date = Date()
    var dateFormatter = DateFormatter()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setupTime), userInfo: nil, repeats: true)
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupTime()
        setupLabel()
        setupButton()
    }
    
    private func setupLabel() {
        bloodSugarLabel.text = bloodSugarIndex
    }
    
    private func setupButton() {
        checkButton.setTitle("確認", for: .normal)
        changeButton.setTitle("更正", for: .normal)
    }
    
    @objc func setupTime() {
        dateFormatter.dateFormat = "HH:mm"
        
        let time = dateFormatter.string(from: Date())
        timeLabel.text = time
    }
    
    // MARK: - IBAction
    
    @IBAction func check(_ sender: Any) {
        let nextVC = MainViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func change(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extension

// MARK: - Protocol
