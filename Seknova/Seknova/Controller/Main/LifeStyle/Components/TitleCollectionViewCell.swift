//
//  TitleCollectionViewCell.swift
//  Seknova
//
//  Created by imac on 2023/2/8.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleBackgroundView: UIView!
    
    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "TitleCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
