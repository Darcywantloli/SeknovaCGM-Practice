//
//  AlertInformationLabelTableViewCell.swift
//  Seknova
//
//  Created by imac on 2023/2/17.
//

import UIKit

class AlertInformationLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    static let identifier = "AlertInformationLabelTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
