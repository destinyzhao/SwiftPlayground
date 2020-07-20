//
//  BaseViewController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.navigationController!.viewControllers.count > 1) {
             self.setupBackBtn()
        }
        else if ((self.presentingViewController) != nil){
             self.setupBackBtn()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupBackBtn() -> Void {
        
        let leftBarBtn = UIBarButtonItem.init(image: UIImage(named: "navi_back"), style: .plain, target: self, action: #selector(backToPrevious))
        leftBarBtn.tintColor = UIColor.gray
        
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                     action: nil)
        spacer.width = -10;
        
        self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
    }
    
    @objc func backToPrevious(){
        if ((self.presentingViewController) != nil){
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
}
