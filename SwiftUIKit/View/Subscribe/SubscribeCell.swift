//
//  SubscribeCell.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class SubscribeCell: BaseCollectionNibCell {

    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var comicModel: ComicModel? {
           didSet {
            guard let model = comicModel else { return }
            iconView.kf.setImage(urlString: model.cover,
                                    placeholder: nil)
            titleLabel.text = model.name ?? model.title
        }
    }

}
