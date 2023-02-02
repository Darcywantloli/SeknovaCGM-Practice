//
//  LifeStyleViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit

class LifeStyleViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "生活作息"
        view.insertSubview(Background(imageName: "Background5", alpha: 0.25), at: 0)
    }

}
