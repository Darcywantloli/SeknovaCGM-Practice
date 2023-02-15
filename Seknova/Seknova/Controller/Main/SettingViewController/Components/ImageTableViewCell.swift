//
//  ImageTableViewCell.swift
//  Seknova
//
//  Created by imac on 2023/2/14.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var informationLabel: UILabel!
    
    @IBOutlet weak var settingImageView: UIImageView!
    
    static let identifier = "ImageTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
