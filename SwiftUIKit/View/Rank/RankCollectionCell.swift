//
//  RankCollectionCell.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/19.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class RankCollectionCell: BaseCollectionNibCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.masksToBounds = true
        bgView.layer.cornerRadius = 10
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor 
    }

    var rankModel: RankModel? {
           didSet {
               guard let model = rankModel else { return }
            iconView.kf.setImage(urlString: model.cover,placeholder: nil)
               titleLabel.text = model.sortName
           }
       }
}
