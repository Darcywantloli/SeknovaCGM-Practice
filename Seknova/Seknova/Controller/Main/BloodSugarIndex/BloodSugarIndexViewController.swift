//
//  BloodSugarIndexViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit
import Charts

class BloodSugarIndexViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "即時血糖"
        view.insertSubview(Background(imageName: "Background5", alpha: 0.25), at: 0)
    }

}
