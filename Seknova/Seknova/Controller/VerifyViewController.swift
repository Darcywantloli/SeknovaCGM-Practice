//
//  VerifyViewController.swift
//  Seknova
//
//  Created by imac on 2022/11/14.
//

import UIKit

class VerifyViewController: BaseViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var seknovaImageView: UIImageView!
    
    @IBOutlet weak var activatedAccountENLabel: UILabel!
    @IBOutlet weak var activatedAccountCNLabel: UILabel!
    
    @IBOutlet weak var checkEmailLabel: UILabel!

    @IBOutlet weak var sendAgainButton: UIButton!
    @IBOutlet weak var nextStepButton: UIButton!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UI Settings


    // MARK: - IBAction

    @IBAction func nextStep(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

// MARK: - Extensions


// MARK: - Protocol


