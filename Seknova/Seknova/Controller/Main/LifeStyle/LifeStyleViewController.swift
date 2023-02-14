//
//  LifeStyleViewController.swift
//  Seknova
//
//  Created by imac on 2022/12/30.
//

import UIKit

class LifeStyleViewController: BaseViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var recordTimeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var arrowDownImageView: UIImageView!
    
    @IBOutlet weak var titleCollectionView: UICollectionView!
    @IBOutlet weak var subtitleCollectionView: UICollectionView!
    
    @IBOutlet weak var attributeTableView: UITableView!
    
    @IBOutlet weak var settimeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var timePickerView: UIPickerView!
    
    // MARK: - Variables
    
    let date = Date()
    var dateFormatter = DateFormatter()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "生活作息"

        setupUI()
    }
    
    // MARK: - UI Settings

    func setupUI() {
        setupLabel()
        setupButton()
        setupTableView()
        setupPickerView()
        setupCollectionView()
    }
    
    private func setupLabel() {
        dateFormatter.dateFormat = "yyyy/MM/dd EEEE a HH:mm"
        dateFormatter.locale = Locale(identifier: "zh_TW")
        let time = dateFormatter.string(from: Date())
        
        timeLabel.text = time
    }
    
    private func setupButton() {
        addButton.isHidden = true
    }
    
    private func setupTableView() {
        attributeTableView.isHidden = true
    }
    
    private func setupPickerView() {
        timePickerView.isHidden = true
    }
    
    private func setupCollectionView() {
        titleCollectionView.delegate = self
        titleCollectionView.dataSource = self
        
        titleCollectionView.register(UINib(nibName: "TitleCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        
        subtitleCollectionView.delegate = self
        subtitleCollectionView.dataSource = self
        
        subtitleCollectionView.isHidden = true
    }
    
}

extension LifeStyleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case titleCollectionView:
            return 7
        case subtitleCollectionView:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = titleCollectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier,
                                                               for: indexPath) as! TitleCollectionViewCell
            
            cell.titleBackgroundView.layer.cornerRadius = 31
            cell.titleImageView.image = UIImage(named: "meal")
            cell.titleLabel.text = "用餐"
            
            return cell
        case 1:
            let cell = titleCollectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier,
                                                               for: indexPath) as! TitleCollectionViewCell
            
            cell.titleBackgroundView.layer.cornerRadius = 31
            cell.titleImageView.image = UIImage(named: "exercise")
            cell.titleLabel.text = "運動"
            
            return cell
        case 2:
            let cell = titleCollectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier,
                                                               for: indexPath) as! TitleCollectionViewCell
            
            cell.titleBackgroundView.layer.cornerRadius = 31
            cell.titleImageView.image = UIImage(named: "insulin")
            cell.titleLabel.text = "胰島素"
            
            return cell
        case 3:
            let cell = titleCollectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier,
                                                               for: indexPath) as! TitleCollectionViewCell
            
            cell.titleBackgroundView.layer.cornerRadius = 31
            cell.titleImageView.image = UIImage(named: "sleep")
            cell.titleLabel.text = "睡眠"
            
            return cell
        case 4:
            let cell = titleCollectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier,
                                                               for: indexPath) as! TitleCollectionViewCell
            
            cell.titleBackgroundView.layer.cornerRadius = 31
            cell.titleImageView.image = UIImage(named: "awaken")
            cell.titleLabel.text = "起床"
            
            return cell
        case 5:
            let cell = titleCollectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier,
                                                               for: indexPath) as! TitleCollectionViewCell
            
            cell.titleBackgroundView.layer.cornerRadius = 31
            cell.titleImageView.image = UIImage(named: "bath")
            cell.titleLabel.text = "洗澡"
            
            return cell
        case 6:
            let cell = titleCollectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier,
                                                               for: indexPath) as! TitleCollectionViewCell
            
            cell.titleBackgroundView.layer.cornerRadius = 31
            cell.titleImageView.image = UIImage(named: "other")
            cell.titleLabel.text = "其他"
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.item {
//        case 0:
//        case 1:
//        case 2:
//        case 3:
//        case 4:
//        case 5:
//        case 6:
//        default:
//            <#code#>
//        }
    }
}
