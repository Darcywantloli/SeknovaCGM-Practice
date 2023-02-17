//
//  AlertSettingViewController.swift
//  Seknova
//
//  Created by imac on 2023/2/16.
//

import UIKit

class AlertSettingViewController: UIViewController {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.register(UINib(nibName: "TwoLabelsTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: TwoLabelsTableViewCell.identifier)
    }
}

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
        return " "
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
        default:
            return UITableViewCell()
        }
    }
}
