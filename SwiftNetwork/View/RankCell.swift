//
//  RankCell.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/19.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import Kingfisher
import Reusable

class RankCell: BaseTableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desccLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var rankModel: RankModel? {
           didSet {
            guard let model = rankModel else { return }
            iconView.kf.setImage(urlString:  rankModel?.cover, placeholder: nil)
            titleLabel.text = "\(model.title ?? "")榜"
            desccLabel.text = model.subTitle
        }
        
    }
    
}
