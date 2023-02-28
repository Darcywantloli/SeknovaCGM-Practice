//
//  TextFieldTableViewCell.swift
//  Seknova
//
//  Created by imac on 2022/12/7.
//

import UIKit

class GetInformationTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var informationTextField: UITextField!
    
    static let identifier = "GetInformationTextFieldTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
