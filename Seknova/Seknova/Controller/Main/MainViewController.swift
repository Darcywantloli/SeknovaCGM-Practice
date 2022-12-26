//
//  MainViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/21.
//

import UIKit

class MainViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var burgerListView: UIView!
    
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var dailyButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    
    // MARK: - Variables
    
    var showOrNot = true
    let dropDownTransparent = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let deviceEventButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupView()
        setupNavigationBarButton()
    }
    
    private func setupView() {
        hideBurgerList(times: 0)
    }
    
    private func setupNavigationBarButton() {
        dropDownTransparent.setBackgroundImage(UIImage(named: "ThreeLineSmall"), for: .normal)
        dropDownTransparent.addTarget(self, action: #selector(burgerList), for: .allEvents)
        
        let dropDownButton = UIBarButtonItem(customView: dropDownTransparent)
        
        let dropDownButtonWidth = dropDownButton.customView?.widthAnchor.constraint(equalToConstant: 30)
        dropDownButtonWidth?.isActive = true
        let dropDownButtonHeight = dropDownButton.customView?.heightAnchor.constraint(equalToConstant: 30)
        dropDownButtonHeight?.isActive = true
        
        deviceEventButton.setBackgroundImage(UIImage(named: "unlink"), for: .normal)
        deviceEventButton.addTarget(self, action: #selector(deviceEvent), for: .allEvents)
        
        let deviceButton = UIBarButtonItem(customView: deviceEventButton)
        
        let deviceButtonWidth = deviceButton.customView?.widthAnchor.constraint(equalToConstant: 30)
        deviceButtonWidth?.isActive = true
        let deviceButtonHeight = deviceButton.customView?.heightAnchor.constraint(equalToConstant: 30)
        deviceButtonHeight?.isActive = true
        
        self.navigationItem.leftBarButtonItems = [dropDownButton, deviceButton]
    }

    // MARK: - IBAction
    
    func showBurgerList() {
        UIView.animate(withDuration: 0.5, animations: {
            let moveRight = CGAffineTransform(translationX: 0.0, y: 0.0)
            
            self.burgerListView.transform = moveRight
        })
    }
    
    func hideBurgerList(times: Double) {
        UIView.animate(withDuration: times, animations: {
            let moveWidth = UIScreen.main.bounds.width / 4
            let moveLeft = CGAffineTransform(translationX: -(moveWidth), y: 0.0)
            
            self.burgerListView.transform = moveLeft
        })
    }
    
    @objc func burgerList() {
        if showOrNot {
            showBurgerList()
            showOrNot = !showOrNot
        } else {
            hideBurgerList(times: 0.5)
            showOrNot = !showOrNot
        }
    }
    
    @objc func deviceEvent() {
        let popupVC = DeviceStatusViewController()
        
        popupVC.event = .transmitterOnSensorOff
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = deviceEventButton
        popupVC.popoverPresentationController?.sourceRect = deviceEventButton.bounds
        
        present(popupVC, animated: true)
    }
}

// MARK: - Extension

extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - Protocol

