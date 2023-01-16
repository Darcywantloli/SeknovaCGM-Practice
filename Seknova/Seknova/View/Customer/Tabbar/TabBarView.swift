//
//  TabBarView.swift
//  Seknova
//
//  Created by imac on 2022/12/29.
//

import UIKit

class TabBarView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var historyButton: BarButtonItemView!
    @IBOutlet weak var bloodSugarCorrectionButton: BarButtonItemView!
    @IBOutlet weak var bloodSugarIndexButton: BarButtonItemView!
    @IBOutlet weak var dailyLifeButton: BarButtonItemView!
    @IBOutlet weak var personalInformationButton: BarButtonItemView!
    
    // MARK: - Variables
    
    var delegate: CustomTabBarDelegate?

    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        addXibView()
    }
    
    // MARK: - UI Settings
    
    func setInit() {
        historyButton.setInit(buttonTag: 0, text: "歷史記錄", image: "history", delagate: self)
        bloodSugarCorrectionButton.setInit(buttonTag: 1, text: "血糖校正", image: "blood-1", delagate: self)
        bloodSugarIndexButton.setInit(buttonTag: 2, text: "即時血糖", image: "trend", delagate: self)
        dailyLifeButton.setInit(buttonTag: 3, text: "生活作息", image: "calendar-1", delagate: self)
        personalInformationButton.setInit(buttonTag: 4, text: "個人資訊", image: "user", delagate: self)
    }
}

// MARK: - Extensions

fileprivate extension TabBarView {
    func addXibView() {
        if let loadView = Bundle(for: TabBarView.self)
            .loadNibNamed("TabBarView", owner: self)?
            .first as? UIView {
            addSubview(loadView)
            loadView.frame = bounds
        }
    }
}

// MARK: - CustomButtonDelegate

extension TabBarView: CustomButtonDelegate {
    func target(index: Int, button: UIButton) {
        delegate?.targetTabBar(index: index, button: button)
    }
}

// MARK: - CustomTabBarDelegate

protocol CustomTabBarDelegate: NSObjectProtocol {
    
    func targetTabBar(index: Int, button: UIButton)
}
