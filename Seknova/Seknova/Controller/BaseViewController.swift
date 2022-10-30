//
//  BaseViewController.swift
//  Seknova
//
//  Created by imac on 2022/10/19.
//
import UIKit
import Foundation

class BaseViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    //NavigationBar樣式
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
    
    // 設定按鈕邊框
    func setUpButton(button: UIButton,
                     borderWidth: CGFloat = 5, borderColor: UIColor = .navigationBar!) {
        let screenHeight = UIScreen.main.bounds.height
        let buttonHeight = screenHeight * 0.065
        
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.layer.cornerRadius = (buttonHeight / 2) - 1
    }
}

