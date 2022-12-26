//
//  DeviceStatusViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/23.
//

import UIKit

class DeviceStatusViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Variables
    
    var event: Status = .transmitterOnSensorOn
    
    enum Status: String {
        case transmitterOffSensorOff
        case transmitterOffSensorOn
        case transmitterOnSensorOff
        case transmitterOnSensorOn
        
        var response: String {
            switch self {
            case .transmitterOffSensorOff:
                return "發射器尚未啟用，請使用者先行啟用後才可以進一步顯示資料"
            case .transmitterOffSensorOn:
                return "無此狀態"
            case .transmitterOnSensorOff:
                return "感測器尚未啟用，請使用者先行啟用才可以顯示資料"
            case .transmitterOnSensorOn:
                return "感測器已啟用"
            }
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
    }

    // MARK: - UI Settings
    
    func setupLabel() {
        label.text = event.response
    }
  
    // MARK: - IBAction
    
}

// MARK: - Extension

// MARK: - Protocol
