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
        
        settingTableView.register(UINib(nibName: "TwoLabelsTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: TwoLabelsTableViewCell.identifier)
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
                let cell = tableView.dequeueReusableCell(withIdentifier: TwoLabelsTableViewCell.identifier,
                                                         for: indexPath) as! TwoLabelsTableViewCell
                
                cell.accessoryType = .disclosureIndicator
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: TwoLabelsTableViewCell.identifier,
                                                         for: indexPath) as! TwoLabelsTableViewCell
                
                cell.accessoryType = .disclosureIndicator
                
                return cell
            default:
                return UITableViewCell()
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TwoLabelsTableViewCell.identifier,
                                                     for: indexPath) as! TwoLabelsTableViewCell
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TwoLabelsTableViewCell.identifier,
                                                     for: indexPath) as! TwoLabelsTableViewCell
            
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
                let nextVC = HighAlertViewController()
                
                self.navigationController?.pushViewController(nextVC, animated: true)
            default:
                break
            }
        default:
            break
        }
    }
}
