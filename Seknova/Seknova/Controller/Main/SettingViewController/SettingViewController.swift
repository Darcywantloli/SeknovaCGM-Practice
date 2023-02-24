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
    
    let date = Date()
    var dateFormatter = DateFormatter()
    
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
        if warming {
            return 15
        } else {
            return 8
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if warming {
            switch indexPath.row {
            case 0:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                cell.informationLabel.text = "警示設定"
                cell.settingImageView.image = UIImage(named: "ArrowRight")
                
                return cell
            case 1:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                cell.informationLabel.text = "校正模式"
                cell.settingImageView.image = UIImage(named: "ArrowRight")
                
                return cell
            case 2:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "設定ADC初始值"
                cell.indexLabel.text = "0"
                
                return cell
            case 3:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "設定X軸時間間距(per/s)"
                cell.indexLabel.text = "3600.0 per/s"
                
                return cell
            case 4:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "設定y軸上下限"
                cell.indexLabel.text = "400.0"
                
                return cell
            case 5:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                cell.informationLabel.text = "單位切換(mmol/L)"
                cell.onOffSwitch.isOn = false
                
                return cell
            case 6:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                cell.informationLabel.text = "顯示數值資訊"
                cell.onOffSwitch.isOn = true
                
                return cell
            case 7:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                cell.informationLabel.text = "顯示RSSI"
                cell.onOffSwitch.isOn = false
                
                return cell
            case 8:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                cell.informationLabel.text = "上傳雲端"
                cell.onOffSwitch.isOn = true
                
                return cell
            case 9:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                cell.informationLabel.text = "超出高低血糖警示"
                cell.onOffSwitch.isOn = false
                
                return cell
            case 10:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                cell.informationLabel.text = "資料同步"
                cell.settingImageView.image = UIImage(named: "reload")
                
                return cell
            case 11:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "暖機狀態"
                cell.indexLabel.text = "On"
                
                return cell
            case 12:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                dateFormatter.dateFormat = "MM:dd HH:mm:ss"
                
                let time = dateFormatter.string(from: date)
                
                cell.informationLabel.text = "上傳事件日誌"
                cell.indexLabel.text = time
                
                return cell
            case 13:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "韌體版本"
                cell.indexLabel.text = "1.24.9"
                
                return cell
            case 14:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "App版本"
                cell.indexLabel.text = "00.00.61"
                
                return cell
            default:
                return UITableViewCell()
            }
        } else {
            switch indexPath.row {
            case 0:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                cell.informationLabel.text = "警示設定"
                cell.settingImageView.image = UIImage(named: "ArrowRight")
                
                return cell
            case 1:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                cell.informationLabel.text = "單位切換(mmol/L)"
                cell.onOffSwitch.isOn = false
                
                return cell
            case 2:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                                for: indexPath) as! SwitchTableViewCell
                
                cell.informationLabel.text = "超出高低血糖警示"
                cell.onOffSwitch.isOn = false
                
                return cell
            case 3:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                                for: indexPath) as! ImageTableViewCell
                
                cell.informationLabel.text = "資料同步"
                cell.settingImageView.image = UIImage(named: "reload")
                
                return cell
            case 4:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "暖機狀態"
                cell.indexLabel.text = "Off"
                
                return cell
            case 5:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                dateFormatter.dateFormat = "MM/dd HH:mm:ss"
                
                let time = dateFormatter.string(from: date)
                
                cell.informationLabel.text = "上傳事件日誌"
                cell.indexLabel.text = time
                
                return cell
            case 6:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "韌體版本"
                cell.indexLabel.text = "1.24.9"
                
                return cell
            case 7:
                let cell = settingTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                                for: indexPath) as! LabelTableViewCell
                
                cell.informationLabel.text = "App版本"
                cell.indexLabel.text = "00.00.61"
                
                return cell
            default:
                return UITableViewCell()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if warming {
            
        } else {
            switch indexPath.row {
            case 0:
                let nextVC = AlertSettingViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            case 4:
                Alert.showAlertWithTextField(title: "請輸入對應字串",
                                             message: "輸入0000進入正常模式\n輸入8888進入開發者模式",
                                             vc: self,
                                             confirmTitle: "確認",
                                             cancelTitle: "取消",
                                             setTextField: { textField in
                    textField.keyboardType = .numberPad
                },
                                             comfirm: { texField in
                    if self.warming && texField.text == "0000" {
                        self.warming = !self.warming
                        self.settingTableView.reloadData()
                    } else if !self.warming && texField.text == "8888" {
                        self.warming = !self.warming
                        self.settingTableView.reloadData()
                    } else {
                        Alert.showAlertWith(title: "錯誤",
                                            message: "請輸入正確的字串",
                                            vc: self,
                                            confirmTitle: "確認")
                    }
                })
            default:
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = settingTableView.frame.height
        
        return height / 15
    }
    
}

// MARK: - Protocol
