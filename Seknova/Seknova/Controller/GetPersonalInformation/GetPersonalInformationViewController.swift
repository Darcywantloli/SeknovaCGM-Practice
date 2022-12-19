//
//  PersonalInformationViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/7.
//

import UIKit

class GetPersonalInformationViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var informationTableView: UITableView!
    
    @IBOutlet weak var nextStepButton: UIButton!
    
    // MARK: - Variables
    
    var info: [String] = ["", "", "", "", "", "", "", "", "", "", "", ""]
    
    var datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    var toolBar = UIToolbar()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Personal Information"
        
        info[AppDefine.PersonalInformation.email.rawValue] = UserPreference.shared.email
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupButton()
        setupTableView()
    }
    
    private func setupButton() {
        nextStepButton.setTitle("下一步", for: .normal)
    }
    
    private func setupTableView() {
        informationTableView.delegate = self
        informationTableView.dataSource = self
        
        informationTableView.register(UINib(nibName: "PersonalTextFieldTableViewCell", bundle: nil),
                                      forCellReuseIdentifier: PersonalTextFieldTableViewCell.identifier)
        informationTableView.register(UINib(nibName: "PersonalActionSheetTableViewCell", bundle: nil),
                                      forCellReuseIdentifier: PersonalActionSheetTableViewCell.identifier)
    }
    
    private func setupDatePicker() {
        var height = self.view.bounds.height
        var width = self.view.bounds.width
        var calendar = Calendar.current
        
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
        
        var dateFormat = DateFormatter()
        
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
    
    // MARK: - IBAction
    
    @IBAction func next(_ sender: Any) {
        var saveData = true
        for data in 0...11 {
            if info[data] == "" && data != 4 && data != 5{
                saveData = false
            }
        }
        
        if saveData {
            var userInformation = UserInformationTable()
            
            userInformation.UserID = info[3]
            userInformation.FirstName = info[0]
            userInformation.LastName = info[1]
            userInformation.Birthday = info[2]
            userInformation.Email = info[3]
            userInformation.Phone = info[4]
            userInformation.Address = info[5]
            userInformation.Gender = info[6]
            userInformation.Height = Int(info[7]) ?? 0
            userInformation.Weight = Int(info[8]) ?? 0
            userInformation.Race = info[9]
            userInformation.Liquor = info[10]
            userInformation.Smoke = info[11]
            
            LocalDatabase.shared.addUserInformation(userInformation: userInformation)
            
            let nextVC = ScanningTransmitterViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        } else {
            Alert.showAlertWith(title: "錯誤", message: "請輸入資料", vc: self, confirmTitle: "確認")
        }
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

// MARK: - UITableViewDelegate, UITableViewDataSource

extension GetPersonalInformationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return AppDefine.PersonalInformation.allCases.count
        } else {
            return AppDefine.BodyInformation.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        imageView.image = UIImage(named: "ArrowDown2")
        imageView.contentMode = .scaleAspectFill
        
        if indexPath.section == 0 {
            switch AppDefine.PersonalInformation.allCases[indexPath.row] {
            case .firstName:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.delegate = self
                cell.informationTextField.tag = indexPath.row
                
                return cell
            case .lastName:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.delegate = self
                cell.informationTextField.tag = indexPath.row
                
                return cell
            case .birthday:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row]
                cell.accessoryView = imageView
                
                return cell
            case .email:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.isEnabled = false
                
                return cell
            case .phone:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.keyboardType = .numberPad
                cell.informationTextField.delegate = self
                cell.informationTextField.tag = indexPath.row
                
                return cell
            case .address:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.delegate = self
                cell.informationTextField.tag = indexPath.row
                
                return cell
            }
        } else {
            switch AppDefine.BodyInformation.allCases[indexPath.row] {
            case .gender:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row + 6]
                cell.accessoryView = imageView
                
                return cell
            case .height:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row + 6]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.keyboardType = .numberPad
                cell.informationTextField.delegate = self
                cell.informationTextField.tag = indexPath.row + 6
                
                return cell
            case .weight:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row + 6]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.keyboardType = .numberPad
                cell.informationTextField.delegate = self
                cell.informationTextField.tag = indexPath.row + 6
                
                return cell
            case .race:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row + 6]
                cell.accessoryView = imageView
                
                return cell
            case .liquor:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row + 6]
                cell.accessoryView = imageView
                
                return cell
            case .smoke:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row + 6]
                cell.accessoryView = imageView
                
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let gruop = ["個人資訊", "身體數值"]
        
        return gruop[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        informationTableView.deselectRow(at: indexPath, animated: false)
        view.endEditing(true)
        
        if indexPath.section == 0 {
            switch AppDefine.PersonalInformation.allCases[indexPath.row] {
            case .birthday:
                setupDatePicker()
            default:
                return
            }
        } else {
            switch AppDefine.BodyInformation.allCases[indexPath.row] {
            case .gender:
                Alert.showActionSheetWith(names: AppDefine.BodyInformation.allCases[indexPath.row].array,
                                          vc: self) { response in
                    self.info[indexPath.row + 6] = AppDefine.BodyInformation.allCases[indexPath.row].array[response]
                    DispatchQueue.main.async {
                        tableView.reloadData()
                    }
                }
            case .race:
                Alert.showActionSheetWith(names: AppDefine.BodyInformation.allCases[indexPath.row].array,
                                          vc: self) { response in
                    self.info[indexPath.row + 6] = AppDefine.BodyInformation.allCases[indexPath.row].array[response]
                    DispatchQueue.main.async {
                        tableView.reloadData()
                    }
                }
            case .liquor:
                Alert.showActionSheetWith(names: AppDefine.BodyInformation.allCases[indexPath.row].array,
                                          vc: self) { response in
                    self.info[indexPath.row + 6] = AppDefine.BodyInformation.allCases[indexPath.row].array[response]
                    DispatchQueue.main.async {
                        tableView.reloadData()
                    }
                }
            case .smoke:
                Alert.showActionSheetWith(names: AppDefine.BodyInformation.allCases[indexPath.row].array,
                                          vc: self) { response in
                    self.info[indexPath.row + 6] = AppDefine.BodyInformation.allCases[indexPath.row].array[response]
                    DispatchQueue.main.async {
                        tableView.reloadData()
                    }
                }
            default:
                return
            }
        }
    }
}

// MARK: - UITextViewDelegate

extension GetPersonalInformationViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        info[textField.tag] = textField.text!
    }
}

// MARK: - Protocol
