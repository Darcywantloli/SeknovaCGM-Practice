//
//  SwitchTableViewCell.swift
//  Seknova
//
//  Created by imac on 2023/2/14.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var informationLabel: UILabel!
    
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    static let identifier = "SwitchTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
