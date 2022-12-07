//
//  BaseViewController.swift
//  Seknova
//
//  Created by imac on 2022/10/19.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Variables
    
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
    
    func closeKeyboardWhenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
}
// MARK: - Extensions

// MARK: - Protocol
