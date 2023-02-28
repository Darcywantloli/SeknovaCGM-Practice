//
//  PersonalInformationViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit

class PersonalInformationViewController: BaseViewController {

    @IBOutlet weak var informationTableView: UITableView!
    
    var info: [String] = ["", "", "", "", "", "", "", "", "", "", "", ""]
    
    var datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    var toolBar = UIToolbar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "個人資訊"
        
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        informationTableView.register(UINib(nibName: "SetInformationTextFieldTableViewCell", bundle: nil),
                                      forCellReuseIdentifier: SetInformationTextFieldTableViewCell.identifier)
        informationTableView.register(UINib(nibName: "SetInformationLabelTableViewCell", bundle: nil),
                                      forCellReuseIdentifier: SetInformationLabelTableViewCell.identifier)
        
        informationTableView.delegate = self
        informationTableView.dataSource = self
    }
    
    private func setupDatePicker() {
        let height = self.view.bounds.height
        let width = self.view.bounds.width
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: Date())
        let month = calendar.component(.month, from: Date())
        let day = calendar.component(.day, from: Date())
        
        let dateComponents = DateComponents(calendar: Calendar.current, year: year, month: month, day: day)
        
        let doneButton = UIBarButtonItem(title: "完成",
                                         style: .done,
                                         target: self,
                                         action: #selector(selectDate))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil)
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        toolBar.barTintColor = .white
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.frame = CGRect(x: 0, y: height - 250, width: width, height: 50)
        
        let dateFormat = DateFormatter()
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.maximumDate = dateComponents.date
        datePicker.locale = Locale(identifier: "zh_TW")
        datePicker.frame = CGRect(x: 0, y: height - 200, width: width, height: 200)
        datePicker.date = Date()
        
        dateFormat.dateFormat = "yyyy/MM/dd"

        view.addSubview(toolBar)
        view.addSubview(datePicker)
    }
    
    @objc func selectDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
       
        let birthday = formatter.string(from: datePicker.date)
        info[2] = birthday
        
        informationTableView.reloadData()
        
        datePicker.removeFromSuperview()
        toolBar.removeFromSuperview()
    }

}

extension PersonalInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return AppDefine.PersonalInformation.allCases.count
        case 1:
            return AppDefine.BodyInformation.allCases.count
        case 2:
            return 3
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch AppDefine.PersonalInformation.allCases[indexPath.row] {
            case .firstName:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case .lastName:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case .birthday:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationLabelTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationLabelTableViewCell
                
                return cell
            case .email:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case .phone:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case .address:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            }
        case 1:
            switch AppDefine.BodyInformation.allCases[indexPath.row] {
            case .gender:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationLabelTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationLabelTableViewCell
                
                return cell
            case .height:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case .weight:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case .race:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationLabelTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationLabelTableViewCell
                
                return cell
            case .liquor:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationLabelTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationLabelTableViewCell
                
                return cell
            case .smoke:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationLabelTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationLabelTableViewCell
                
                return cell
            }
        default:
            switch indexPath.row {
            case 0:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case 1:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            case 2:
                let cell = informationTableView.dequeueReusableCell(withIdentifier: SetInformationTextFieldTableViewCell.identifier,
                                                                    for: indexPath) as! SetInformationTextFieldTableViewCell
                
                return cell
            default:
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group = ["個人資訊", "身體數值", "帳號"]
        
        return group[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
