//
//  SettingLabelTableViewCell.swift
//  Seknova
//
//  Created by imac on 2023/2/14.
//

import UIKit

class SettingLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var informationLabel: UILabel!
    
    @IBOutlet weak var indexLabel: UILabel!
    
    static let identifier = "SettingLabelTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
