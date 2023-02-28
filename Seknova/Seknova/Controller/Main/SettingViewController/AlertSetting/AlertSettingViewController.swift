//
//  AlertSettingViewController.swift
//  Seknova
//
//  Created by imac on 2023/2/16.
//

import UIKit

class AlertSettingViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var settingTableView: UITableView!
    
    // MARK: - Variables
    
    var highAlertOnOff = false
    var highAlertIndex = 0
    
    var lowAlertOnOff = false
    var lowAlertIndex = 0
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.register(UINib(nibName: "AlertInformationLabelTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: AlertInformationLabelTableViewCell.identifier)
    }
    
    // MARK: - IBAction
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension AlertSettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return " "
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Note: Urgent low alert at 55 mg/dL is always on."
        default:
            return " "
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: AlertInformationLabelTableViewCell.identifier,
                                                         for: indexPath) as! AlertInformationLabelTableViewCell
                
                cell.accessoryType = .disclosureIndicator
                cell.titleLabel.text = "High Alerts"
                
                if highAlertOnOff {
                    cell.indexLabel.text = "\(highAlertIndex) mg/dL"
                } else {
                    cell.indexLabel.text = "none"
                }
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: AlertInformationLabelTableViewCell.identifier,
                                                         for: indexPath) as! AlertInformationLabelTableViewCell
                
                cell.accessoryType = .disclosureIndicator
                cell.titleLabel.text = "Low Alerts"
                
                if lowAlertOnOff {
                    cell.indexLabel.text = "\(lowAlertIndex) mg/dL"
                } else {
                    cell.indexLabel.text = "None"
                }
                
                return cell
            default:
                return UITableViewCell()
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AlertInformationLabelTableViewCell.identifier,
                                                     for: indexPath) as! AlertInformationLabelTableViewCell
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: AlertInformationLabelTableViewCell.identifier,
                                                     for: indexPath) as! AlertInformationLabelTableViewCell
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = settingTableView.frame.height
        
        return height / 12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let nextVC = BloodSugarAlertViewController()
                
                nextVC.root = .HighBloodSugar
                nextVC.delegate = self
                
                self.navigationController?.pushViewController(nextVC, animated: true)
            case 1:
                let nextVC = BloodSugarAlertViewController()
                
                nextVC.root = .LowBloodSuagr
                nextVC.delegate = self
                
                self.navigationController?.pushViewController(nextVC, animated: true)
            default:
                break
            }
        default:
            break
        }
    }
}

extension AlertSettingViewController: AlertTypeDelegate {
    func target(onOff: Bool, index: Int, type: Int) {
        if type == 1 {
            highAlertOnOff = onOff
            highAlertIndex = index
        } else if type == 2 {
            lowAlertOnOff = onOff
            lowAlertIndex = index
        } else {
            highAlertOnOff = false
            lowAlertOnOff = false
        }
        
        settingTableView.reloadData()
    }
}
