//
//  SetUpBloodSugerIndexViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/5.
//

import UIKit

class SetUpBloodSugerIndexViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var titleENLabel: UILabel!
    
    @IBOutlet weak var setLowSugerLabel: UILabel!
    
    @IBOutlet weak var lowSugerView: UIView!
    @IBOutlet weak var lowSugerLabel: UILabel!
    @IBOutlet weak var lowSugerPickerView: UIPickerView!
    
    @IBOutlet weak var setHighSugerLabel: UILabel!
    
    @IBOutlet weak var highSugerView: UIView!
    @IBOutlet weak var highSugerLabel: UILabel!
    @IBOutlet weak var highSugerPickerView: UIPickerView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var knowMoreButton: UIButton!
    
    // MARK: - Variables
    
    let lowSuger = [Int](65...75)
    let highSuger = [Int](150...250)
    
    var selectLowSuger = 0
    var selectHighSuger = 0
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setNavigationBar()
    }

    // MARK: - UI Settings
    
    func setupUI() {
        setupLabel()
        setupButton()
        setupPickerView()
    }
    
    private func setupView() {
        lowSugerView.layer.shadowOpacity = 0.5
        lowSugerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        highSugerView.layer.shadowOpacity = 0.5
        highSugerView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    private func setupLabel() {
        titleENLabel.text = "SET UP BLOOD SUGER INDEX"
        titleENLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleENLabel.adjustsFontForContentSizeCategory = true
        
        lowSugerLabel.text = "mg/dL"
        highSugerLabel.text = "mg/dL"
    }
    
    private func setupButton() {
        saveButton.setTitle("儲存", for: .normal)
        knowMoreButton.setTitle("了解更多", for: .normal)
    }
    
    private func setupPickerView() {
        lowSugerPickerView.delegate = self
        lowSugerPickerView.dataSource = self
        
        highSugerPickerView.delegate = self
        highSugerPickerView.dataSource = self
        
        lowSugerPickerView.selectRow(5, inComponent: 0, animated: false)
        highSugerPickerView.selectRow(50, inComponent: 0, animated: false)
    }
    
    // MARK: - IBAction
    
    @IBAction func save(_ sender: Any) {
        UserPreference.shared.lowSuger = selectLowSuger
        UserPreference.shared.highSuger = selectHighSuger
        
        let nextVC = GetPersonalInformationViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func knowMore(_ sender: Any) {
        let popupVC = KnowMoreViewController()
        let popWidth = view.bounds.width
        
        popupVC.root = .SetUpBloodSugerIndexViewController
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = knowMoreButton
        popupVC.popoverPresentationController?.sourceRect = knowMoreButton.bounds
        popupVC.preferredContentSize = CGSize(width: popWidth, height: 200)

        present(popupVC, animated: true)
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension SetUpBloodSugerIndexViewController: UIPickerViewDelegate,
                                              UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case lowSugerPickerView:
            return lowSuger.count
        case highSugerPickerView:
            return highSuger.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case lowSugerPickerView:
            return lowSuger[row].description
        case highSugerPickerView:
            return highSuger[row].description
        default:
            return "error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case lowSugerPickerView:
            selectLowSuger = lowSuger[row]
        case highSugerPickerView:
            selectHighSuger = highSuger[row]
        default:
            break
        }
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension SetUpBloodSugerIndexViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController,
                                   traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - Protocol
