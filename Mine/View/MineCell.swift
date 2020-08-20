//
//  MineCell.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class MineCell: BaseTableViewNibCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
