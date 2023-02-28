//
//  SettingImageTableViewCell.swift
//  Seknova
//
//  Created by imac on 2023/2/14.
//

import UIKit

class SettingImageTableViewCell: UITableViewCell {

    @IBOutlet weak var informationLabel: UILabel!
    
    @IBOutlet weak var settingImageView: UIImageView!
    
    static let identifier = "SettingImageTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
