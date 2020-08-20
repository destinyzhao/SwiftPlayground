//
//  ComicCell.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/19.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ComicCell: BaseTableViewNibCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var orderView: UIImageView!
    
     var spinnerName: String?
    var tagString = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var comicModel: ComicModel? {
        didSet {
            guard let model = comicModel else { return }
            iconView.kf.setImage(urlString: model.cover, placeholder: nil)
            
            titleLabel.text = model.name
            subTitleLabel.text = "\(model.tags?.joined(separator: " ") ?? "") | \(model.author ?? "")"
            descLabel.text = model.description
            
            if spinnerName == "更新时间" {
                let comicDate = Date().timeIntervalSince(Date(timeIntervalSince1970: TimeInterval(model.conTag)))
             
                if comicDate < 60 {
                    tagString = "\(Int(comicDate))秒前"
                } else if comicDate < 3600 {
                    tagString = "\(Int(comicDate / 60))分前"
                } else if comicDate < 86400 {
                    tagString = "\(Int(comicDate / 3600))小时前"
                } else if comicDate < 31536000{
                    tagString = "\(Int(comicDate / 86400))天前"
                } else {
                    tagString = "\(Int(comicDate / 31536000))年前"
                }

                orderView.isHidden = true
            } else {
                if model.conTag > 100000000 {
                    tagString = String(format: "%.1f亿", Double(model.conTag) / 100000000)
                } else if model.conTag > 10000 {
                    tagString = String(format: "%.1f万", Double(model.conTag) / 10000)
                } else {
                    tagString = "\(model.conTag)"
                }

                orderView.isHidden = false
            }
        }
    }
    
    var indexPath: IndexPath? {
        didSet {
            guard let indexPath = indexPath else { return }
            if indexPath.row == 0 { orderView.image = UIImage.init(named: "rank_frist") }
            else if indexPath.row == 1 { orderView.image = UIImage.init(named: "rank_second") }
            else if indexPath.row == 2 { orderView.image = UIImage.init(named: "rank_third") }
            else { orderView.image = nil }
        }
    }
    
}
