//
//  HighAlertViewController.swift
//  Seknova
//
//  Created by imac on 2023/2/17.
//

import UIKit

class BloodSugarAlertViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var alertTableView: UITableView!
    
    @IBOutlet weak var bloodSugarPickerView: UIPickerView!
    
    // MARK: - Variables
    
    var root: AlertType = .HighBloodSugar
    var delegate: AlertTypeDelegate?
    
    enum AlertType {
        case HighBloodSugar
        case LowBloodSuagr
    }
    
    let lowBloodSuagr = [Int](70...90)
    let highBloodSugar = [Int](150...250)
    
    var selectIndex = 0
    var alertOnOff = true
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupTableView()
        setupPickerView()
        setupRightBarButton()
    }
    
    private func setupTableView() {
        alertTableView.delegate = self
        alertTableView.dataSource = self
        
        alertTableView.register(UINib(nibName: "SettingSwitchTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: SettingSwitchTableViewCell.identifier)
        alertTableView.register(UINib(nibName: "SettingLabelTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: SettingLabelTableViewCell.identifier)
        
        alertTableView.isScrollEnabled = false
    }
    
    private func setupPickerView() {
        bloodSugarPickerView.delegate = self
        bloodSugarPickerView.dataSource = self
    }
    
    private func setupRightBarButton() {
        let eventButton = UIBarButtonItem(title: "儲存",
                                          style: .plain,
                                          target: self,
                                          action: #selector(saveData))
        
        self.navigationItem.rightBarButtonItem = eventButton
    }
    
    // MARK: - IBAction
    
    @objc func saveData() {
        switch root {
        case .HighBloodSugar:
            delegate?.target(onOff: alertOnOff, index: selectIndex, type: 1)
        case .LowBloodSuagr:
            delegate?.target(onOff: alertOnOff, index: selectIndex, type: 2)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension BloodSugarAlertViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return " "
        case 1:
            switch root {
            case .HighBloodSugar:
                return "高血糖警示"
            case .LowBloodSuagr:
                return "低血糖警示"
            }
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = alertTableView.dequeueReusableCell(withIdentifier: SettingSwitchTableViewCell.identifier,
                                                               for: indexPath) as! SettingSwitchTableViewCell
            
            switch root {
            case .HighBloodSugar:
                cell.informationLabel.text = "高血糖警示"
            case .LowBloodSuagr:
                cell.informationLabel.text = "低血糖警示"
            }
            
            return cell
        case 1:
            let cell = alertTableView.dequeueReusableCell(withIdentifier: SettingLabelTableViewCell.identifier,
                                                               for: indexPath) as! SettingLabelTableViewCell
            
            switch root {
            case .HighBloodSugar:
                cell.informationLabel.text = "High Limit"
            case .LowBloodSuagr:
                cell.informationLabel.text = "Low Limit"
            }
            
            cell.indexLabel.text = "\(selectIndex) mg/dL"
            cell.indexLabel.textColor = .tintColor
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = alertTableView.frame.height
        
        return height / 3.5
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension BloodSugarAlertViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch root {
        case .HighBloodSugar:
            return highBloodSugar.count
        case .LowBloodSuagr:
            return lowBloodSuagr.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch root {
        case .HighBloodSugar:
            return highBloodSugar[row].description
        case .LowBloodSuagr:
            return lowBloodSuagr[row].description
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch root {
        case .HighBloodSugar:
            selectIndex = highBloodSugar[row]
            alertTableView.reloadData()
        case .LowBloodSuagr:
            selectIndex = lowBloodSuagr[row]
            alertTableView.reloadData()
        }
    }
}

protocol AlertTypeDelegate: NSObjectProtocol {
    func target(onOff: Bool, index: Int, type: Int)
}
