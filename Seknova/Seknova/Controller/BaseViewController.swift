//
//  BaseViewController.swift
//  Seknova
//
//  Created by imac on 2022/10/19.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    // NavigationBar樣式
    func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .navigationBar
        appearance.titleTextAttributes = textAttributes
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
// MARK: - Extensions

// MARK: - Protocol
