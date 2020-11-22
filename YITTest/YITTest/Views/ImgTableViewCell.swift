//
//  ImgTableViewCell.swift
//  YITTest
//
//  Created by Michal Zak on 22/11/2020.
//  Copyright © 2020 Michal. All rights reserved.
//

import UIKit

class ImgTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
