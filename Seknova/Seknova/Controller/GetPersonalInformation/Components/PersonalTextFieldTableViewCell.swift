//
//  TextFieldTableViewCell.swift
//  Seknova
//
//  Created by imac on 2022/12/7.
//

import UIKit

class PersonalTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var informationTextField: UITextField!
    
    static let identifier = "PersonalTextFieldTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
