//
//  MineHeaderView.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import SnapKit

extension NSNotification.Name {
    static let USexTypeDidChange = NSNotification.Name("USexTypeDidChange")
}

extension String {
    static let sexTypeKey = "sexTypeKey"
}

class MineHeaderView: UIView {
    
    private lazy var bgView: UIImageView = {
        let bw = UIImageView()
        bw.contentMode = .scaleAspectFill
        return bw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(sexTypeDidChange), name: .USexTypeDidChange, object: nil)
        sexTypeDidChange()
    }
    
    @objc func sexTypeDidChange() {
        let sexType = UserDefaults.standard.integer(forKey: String.sexTypeKey)
        if sexType == 1 {
            bgView.image = UIImage(named: "mine_bg_for_boy")
        } else {
            bgView.image = UIImage(named: "mine_bg_for_girl")
        }
    }
}
