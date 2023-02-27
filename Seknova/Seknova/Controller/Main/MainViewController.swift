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
    
    var vc: [UIViewController] = []
    
    private let historyVC = HistoryViewController()
    private let bloodSugarCorrectionVC = BloodSugarCorrectionViewController()
    private let bloodSugarVC = BloodSugarIndexViewController()
    private let lifeStyleVC = LifeStyleViewController()
    private let personalVC = PersonalInformationViewController()
    
    let dropDownTransparent = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let deviceEventButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let timeLogButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let reloadButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc = [historyVC, bloodSugarCorrectionVC, bloodSugarVC, lifeStyleVC, personalVC]
        
        updateView(2)
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupButton()
        setNavigationBar()
        setupCustomTabBar()
        setupBurgerListView()
    }
    
    private func setupButton() {
        reportButton.setTitle("報表", for: .normal)
        dailyButton.setTitle("日誌", for: .normal)
        settingButton.setTitle("設定", for: .normal)
    }
    
    private func setupCustomTabBar() {
        customTabBar.setInit()
        customTabBar.delegate = self
    }
    
    private func setupNaviagtionBar(_ index: Int) {
        setupLeftNavigationBarButtonItems()
        setupRightNavigationBarButtonItems(index)
        setupNavigationBarTitle(index)
    }
    
    private func setupBurgerListView() {
        burgerListView.layer.shadowOpacity = 0.5
        burgerListView.layer.shadowRadius = 2
        burgerListView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        hideBurgerList(times: 0)
    }
    
    private func setupNavigationBarTitle(_ index: Int) {
        switch index {
        case 0:
            self.title = "歷史紀錄"
        case 1:
            self.title = "血糖校正"
        case 2:
            self.title = "即時血糖"
        case 3:
            self.title = "生活作息"
        case 4:
            self.title = "個人資訊"
        default:
            break
        }
    }
    
    private func setupRightNavigationBarButtonItems(_ index: Int) {
        self.navigationItem.rightBarButtonItem = nil
        
        switch index {
        case 0:
            reloadButton.setBackgroundImage(UIImage(named: "reload"), for: .normal)
            reloadButton.addTarget(self, action: #selector(reload), for: .touchUpInside)
            
            let eventButton = UIBarButtonItem(customView: reloadButton)
            
            let eventButtonWidth = eventButton.customView?.widthAnchor.constraint(equalToConstant: 30)
            eventButtonWidth?.isActive = true
            let eventButtonHeight = eventButton.customView?.heightAnchor.constraint(equalToConstant: 30)
            eventButtonHeight?.isActive = true
            
            self.navigationItem.rightBarButtonItem = eventButton
        case 2:
            timeLogButton.setBackgroundImage(UIImage(named: "user"), for: .normal)
            timeLogButton.addTarget(self, action: #selector(timeLog), for: .touchUpInside)
            
            let eventButton = UIBarButtonItem(customView: timeLogButton)
            
            let eventButtonWidth = eventButton.customView?.widthAnchor.constraint(equalToConstant: 30)
            eventButtonWidth?.isActive = true
            let eventButtonHeight = eventButton.customView?.heightAnchor.constraint(equalToConstant: 30)
            eventButtonHeight?.isActive = true
            
            self.navigationItem.rightBarButtonItem = eventButton
        case 3:
            let eventButton = UIBarButtonItem(title: "事件記錄",
                                              style: .plain,
                                              target: self,
                                              action: #selector(eventLog))
            
            self.navigationItem.rightBarButtonItem = eventButton
        case 4:
            let eventButton = UIBarButtonItem(title: "更新",
                                              style: .plain,
                                              target: self,
                                              action: #selector(update))
            
            self.navigationItem.rightBarButtonItem = eventButton
        default:
            self.navigationItem.rightBarButtonItem = nil
        }
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
        dropDownTransparent.addTarget(self, action: #selector(burgerList), for: .touchUpInside)
        
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
        
        deviceEventButton.addTarget(self, action: #selector(deviceEvent), for: .touchUpInside)
        
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
            let moveWidth = UIScreen.main.bounds.width / 4 + 5
            let moveLeft = CGAffineTransform(translationX: -(moveWidth), y: 0.0)
            
            self.burgerListView.transform = moveLeft
        })
    }
    
    // 切換ContainerView
    private func updateView(_ index: Int) {
        setupNaviagtionBar(index)
    
        if children.first(where: { String(describing: $0.classForCoder) == String(describing: vc[index].classForCoder) }) == nil {
            addChild(vc[index])
            vc[index].view.frame = containerView.bounds
        }
        
        if !showOrNot {
            hideBurgerList(times: 0)
            showOrNot = !showOrNot
        }
        
        containerView.addSubview(vc[index].view!)
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
        
        switch popupVC.event {
        case .transmitterOffSensorOff, .transmitterOnSensorOff:
            popupVC.preferredContentSize = CGSize(width: 250, height: 50)
        case .transmitterOnSensorOn, .transmitterOffSensorOn:
            popupVC.preferredContentSize = CGSize(width: 150, height: 50)
        }
        
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = deviceEventButton
        popupVC.popoverPresentationController?.sourceRect = deviceEventButton.bounds
        
        present(popupVC, animated: true)
    }
    
    @objc func timeLog() {
        print("time")
    }
    
    @objc func eventLog() {
        print("log")
    }
    
    @objc func update() {
        print("update")
    }
    
    @objc func reload() {
        print("reload")
    }
    
    @IBAction func setting(_ sender: Any) {
        let nextVC = SettingViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func logs(_ sender: Any) {
        let nextVC = LogsViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
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

