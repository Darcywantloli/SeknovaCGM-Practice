//
//  BloodSugarCorrectionViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit

class BloodSugarCorrectionViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "血糖校正"
        view.insertSubview(Background(imageName: "Background5", alpha: 0.25), at: 0)
    }

}
