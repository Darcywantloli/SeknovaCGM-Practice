//
//  HighAlertViewController.swift
//  Seknova
//
//  Created by imac on 2023/2/17.
//

import UIKit

class HighAlertViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var hightAlertTableView: UITableView!
    
    @IBOutlet weak var highBloodSugarPickerView: UIPickerView!
    
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
        hightAlertTableView.delegate = self
        hightAlertTableView.dataSource = self
        
        hightAlertTableView.register(UINib(nibName: "SwitchTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: SwitchTableViewCell.identifier)
        hightAlertTableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: LabelTableViewCell.identifier)
    }
    
    // MARK: - IBAction
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HighAlertViewController: UITableViewDelegate, UITableViewDataSource {
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
            return "高血糖警示"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = hightAlertTableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                                                               for: indexPath) as! SwitchTableViewCell
            
            cell.informationLabel.text = "高血糖警示"
            
            return cell
        case 1:
            let cell = hightAlertTableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier,
                                                               for: indexPath) as! LabelTableViewCell
            cell.informationLabel.text = "High Limit"
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension HighAlertViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
}
