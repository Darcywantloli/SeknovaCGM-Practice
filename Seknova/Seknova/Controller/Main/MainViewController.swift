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
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var customTabBar: TabBarView!
    
    // MARK: - Variables
    
    var showOrNot = true
    let dropDownTransparent = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let deviceEventButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    var vc: [UIViewController] = []
    private let historyVC = HistoryViewController()
    private let bloodSugarCorrectionVC = BloodSugarCorrectionViewController()
    private let bloodSugarVC = BloodSugarIndexViewController()
    private let lifeStyleVC = LifeStyleViewController()
    private let personalVC = PersonalInformationViewController()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc = [historyVC, bloodSugarCorrectionVC, bloodSugarVC, lifeStyleVC, personalVC]
        
        updateView(2)
        
        setupUI()
        setNavigationBar()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupBurgerListView()
        setupLeftNavigationBarButtonItems()
        setupCustomTabBar()
    }
    
    private func setupCustomTabBar() {
        customTabBar.setInit()
        customTabBar.delegate = self
    }
    
    private func setupBurgerListView() {
        hideBurgerList(times: 0)
    }
    
    private func setupLeftNavigationBarButtonItems() {
        let deviceImage: Bool
        
        if UserPreference.shared.deviceID == "" {
            deviceImage = false
        } else {
            if UserPreference.shared.sensorID == "" {
                deviceImage = false
            } else {
                deviceImage = true
            }
        }
        
        dropDownTransparent.setBackgroundImage(UIImage(named: "ThreeLineSmall"), for: .normal)
        dropDownTransparent.addTarget(self, action: #selector(burgerList), for: .allEvents)
        
        let dropDownButton = UIBarButtonItem(customView: dropDownTransparent)
        
        let dropDownButtonWidth = dropDownButton.customView?.widthAnchor.constraint(equalToConstant: 30)
        dropDownButtonWidth?.isActive = true
        let dropDownButtonHeight = dropDownButton.customView?.heightAnchor.constraint(equalToConstant: 30)
        dropDownButtonHeight?.isActive = true
        
        if deviceImage {
            deviceEventButton.setBackgroundImage(UIImage(named: "link"), for: .normal)
        } else {
            deviceEventButton.setBackgroundImage(UIImage(named: "unlink"), for: .normal)
        }
        
        deviceEventButton.addTarget(self, action: #selector(deviceEvent), for: .allEvents)
        
        let deviceButton = UIBarButtonItem(customView: deviceEventButton)
        
        let deviceButtonWidth = deviceButton.customView?.widthAnchor.constraint(equalToConstant: 30)
        deviceButtonWidth?.isActive = true
        let deviceButtonHeight = deviceButton.customView?.heightAnchor.constraint(equalToConstant: 30)
        deviceButtonHeight?.isActive = true
        
        self.navigationItem.leftBarButtonItems = [dropDownButton, deviceButton]
    }

    // MARK: - IBAction
    
    // BurgerList動畫
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
    
    // BurgerList狀態判斷
    @objc func burgerList() {
        if showOrNot {
            showBurgerList()
            showOrNot = !showOrNot
        } else {
            hideBurgerList(times: 0.5)
            showOrNot = !showOrNot
        }
    }
    
    // 顯示裝置狀態
    @objc func deviceEvent() {
        let popupVC = DeviceStatusViewController()
        
        if UserPreference.shared.deviceID == "" {
            popupVC.event = (UserPreference.shared.sensorID == "") ? .transmitterOffSensorOff : .transmitterOffSensorOn
        } else {
            popupVC.event = (UserPreference.shared.sensorID == "") ? .transmitterOnSensorOff : .transmitterOnSensorOn
        }
        
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = deviceEventButton
        popupVC.popoverPresentationController?.sourceRect = deviceEventButton.bounds
        popupVC.preferredContentSize = CGSize(width: self.view.bounds.width / 2, height: 100)
        
        present(popupVC, animated: true)
    }
    
    // 切換ContainerView
    private func updateView(_ index: Int) {
        if children.first(where: { String(describing: $0.classForCoder) == String(describing: vc[index].classForCoder) }) == nil {
            addChild(vc[index])
            vc[index].view.frame = containerView.bounds
        }
        containerView.addSubview(vc[index].view!)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension MainViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - CustomTabBarDelegate

extension MainViewController: CustomTabBarDelegate {
    
    func targetTabBar(index: Int, button: UIButton) {
        updateView(index)
    }
}

// MARK: - Protocol

