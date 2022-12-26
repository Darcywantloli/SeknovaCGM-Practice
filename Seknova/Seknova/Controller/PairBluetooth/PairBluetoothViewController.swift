//
//  PairBluetoothViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/19.
//

import UIKit

class PairBluetoothViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleENLabel: UILabel!
    @IBOutlet weak var titleCNLabel: UILabel!
    
    @IBOutlet weak var bluetoothImageView: UIImageView!
    @IBOutlet weak var dotImageView: UIImageView!
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var deviceImageView: UIImageView!
    
    @IBOutlet weak var pairButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var connectImageView: UIImageView!
    @IBOutlet weak var connectSuccessLabel: UILabel!
    
    // MARK: - Variables
    
    var root: LastViewController = .ScanningTransmitterViewController
    
    enum LastViewController {
        case ScanningTransmitterViewController
        case ConnectionViewController
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pair Bluetooth"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        switch root {
        case .ScanningTransmitterViewController:
            setupLabel()
            setupButton()
            setupImageView()
        case .ConnectionViewController:
            setupLabel()
            setupButton()
            setupImageView()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let nextVC = ScanningSensorViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
    
    private func setupLabel() {
        switch root {
        case .ScanningTransmitterViewController:
            titleENLabel.text = "PAIR BLUETOOTH"
            titleCNLabel.text = "配  對  藍  牙  裝  置"
            
            titleENLabel.isHidden = false
            titleCNLabel.isHidden = false
            
            connectSuccessLabel.isHidden = true
        case .ConnectionViewController:
            connectSuccessLabel.text = "配對成功"
            
            connectSuccessLabel.isHidden = false
            
            titleENLabel.isHidden = true
            titleCNLabel.isHidden = true
        }
    }
    
    private func setupButton() {
        switch root {
        case .ScanningTransmitterViewController:
            pairButton.setTitle("配對", for: .normal)
            cancelButton.setTitle("取消", for: .normal)
            
            pairButton.isHidden = false
            cancelButton.isHidden = false
        case .ConnectionViewController:
            pairButton.isHidden = true
            cancelButton.isHidden = true
        }
        
        self.navigationItem.hidesBackButton = true
    }
    
    private func setupImageView() {
        switch root {
        case .ScanningTransmitterViewController:
            bluetoothImageView.isHidden = false
            dotImageView.isHidden = false
            phoneImageView.isHidden = false
            deviceImageView.isHidden = false
            
            connectImageView.isHidden = true
        case .ConnectionViewController:
            bluetoothImageView.isHidden = true
            dotImageView.isHidden = true
            phoneImageView.isHidden = true
            deviceImageView.isHidden = true
            
            connectImageView.isHidden = false
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func pair(_ sender: Any) {
        let nextVC = ConnectionViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extension

// MARK: - Protocol
