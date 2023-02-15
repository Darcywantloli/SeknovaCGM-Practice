//
//  SettingViewCobtrollerViewController.swift
//  Seknova
//
//  Created by imac on 2023/2/14.
//

import UIKit

class SettingViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var settingTableView: UITableView!
    
    // MARK: - Variables
    
    var warming: Bool = false
    
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
        
        settingTableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: ImageTableViewCell.identifier)
        settingTableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: LabelTableViewCell.identifier)
        settingTableView.register(UINib(nibName: "SwitchTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: SwitchTableViewCell.identifier)
    }
    
    // MARK: - IBAction
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if warming {
            switch indexPath.row {
            case 0:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                return cell
            case 1:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                return cell
            case 2:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 3:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 4:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 5:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                return cell
            case 6:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                return cell
            case 7:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                return cell
            case 8:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                return cell
            case 9:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                return cell
            case 10:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                return cell
            case 11:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 12:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 13:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 14:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            default:
                return UITableViewCell()
            }
        } else {
            switch indexPath.row {
            case 0:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                return cell
            case 1:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                return cell
            case 2:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                return cell
            case 3:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                return cell
            case 4:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 5:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 6:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            case 7:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                return cell
            default:
                return UITableViewCell()
            }
        }
        
    }
}

// MARK: - Protocol
