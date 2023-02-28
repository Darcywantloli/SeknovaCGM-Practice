//
//  SetInformationTextFieldTableViewCell.swift
//  Seknova
//
//  Created by imac on 2023/2/28.
//

import UIKit

class SetInformationTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var informationTextField: UITextField!
    
    static let identifier = "SetInformationTextFieldTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
