//
//  BloodSugarCorrectionViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit

class BloodSugarCorrectionViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var knowMoreButton: UIButton!
    @IBOutlet weak var setUpButton: UIButton!
    @IBOutlet weak var setDownButton: UIButton!
    
    
    @IBOutlet weak var bloodSugarTextField: UITextField!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "血糖校正"
        view.insertSubview(Background(imageName: "Background5", alpha: 0.25), at: 0)
    }

    // MARK: - UI Settings
    
    // MARK: - IBAction
    
    @IBAction func knowMore(_ sender: Any) {
        let popupVC = KnowMoreViewController()
        let popWidth = view.bounds.width
        
        popupVC.root = .BloodSugarCorrectionViewController
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = knowMoreButton
        popupVC.popoverPresentationController?.sourceRect = knowMoreButton.bounds
        popupVC.preferredContentSize = CGSize(width: popWidth, height: 160)

        present(popupVC, animated: true)
    }
    
}

// MARK: - UIPopoverPresentationControllerDelegate

extension BloodSugarCorrectionViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController,
                                   traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - Protocol
