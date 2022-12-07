//
//  ActionSheetTableViewCell.swift
//  Seknova
//
//  Created by imac on 2022/12/7.
//

import UIKit

class ActionSheetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var informationLabel: UILabel!
    
    static let identifier = "ActionSheetTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
