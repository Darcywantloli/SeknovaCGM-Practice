//
//  LogsViewController.swift
//  Seknova
//
//  Created by imac on 2023/2/27.
//

import UIKit

class LogsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Logs"
        
        setupRightBarButton()
    }

    private func setupRightBarButton() {
        let allButton = UIBarButtonItem(title: "All",
                                        style: .plain,
                                        target: self,
                                        action: #selector(allEvent))
        
        self.navigationItem.rightBarButtonItem = allButton
    }
    
    @objc func allEvent() {
        self.navigationController?.popViewController(animated: true)
    }
}
