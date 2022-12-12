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
    
    // MARK: - IBAction
    
    @IBAction func next(_ sender: Any) {
        
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
                
                return cell
            case .lastName:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.placeholder = "點擊進行編輯"
                
                return cell
            case .birthday:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row]
                cell.accessoryView = imageView
                
                return cell
            case .email:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row]
                
                return cell
            case .phone:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.keyboardType = .numberPad
                
                return cell
            case .address:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.PersonalInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row]
                cell.informationTextField.placeholder = "點擊進行編輯"
                
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
                
                return cell
            case .weight:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTextFieldTableViewCell.identifier,
                                                         for: indexPath) as! PersonalTextFieldTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationTextField.text = info[indexPath.row + 6]
                cell.informationTextField.placeholder = "點擊進行編輯"
                cell.informationTextField.keyboardType = .numberPad
                
                return cell
            case .race:
                let cell = tableView.dequeueReusableCell(withIdentifier: PersonalActionSheetTableViewCell.identifier,
                                                         for: indexPath) as! PersonalActionSheetTableViewCell
                
                cell.titleLabel.text = AppDefine.BodyInformation.allCases[indexPath.row].title
                cell.informationLabel.text = info[indexPath.row + 6]
                cell.accessoryView = imageView
                
                return cell
            case .drink:
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
                print("生日")
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
            case .drink:
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


// MARK: - Protocol
