//
//  SetInformationLabelTableViewCell.swift
//  Seknova
//
//  Created by imac on 2023/3/1.
//

import UIKit

class SetInformationLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    static let identifier = "SetInformationLabelTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
