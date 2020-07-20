//
//  BaseNavigationController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController:UINavigationController{
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
         self.navigationBar.barTintColor = UIColor.white
    }
}
