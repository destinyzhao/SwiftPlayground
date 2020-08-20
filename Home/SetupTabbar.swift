//
//  SetupTabbar.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import Foundation
import ESTabBarController_swift

public class SetupTabbar{
    static func customStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let baseVC = SwiftBaseViewController()
        baseVC.title = "Swift基础";
        let networkVC = SwiftNetworkViewController()
        networkVC.title = "Swift网络";
        let uiVC = SwiftUIKitViewController()
        uiVC.title = "Swift UI控件";
        
        let baseNavi = BaseNavigationController.init(rootViewController: baseVC)
        let networkNavi = BaseNavigationController.init(rootViewController: networkVC)
        let uiNavi = BaseNavigationController.init(rootViewController: uiVC)
        
        baseNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(), title: "基础", image: UIImage(named: "tabbar_base_n"), selectedImage: UIImage(named: "tabbar_base_s"))
        networkNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(), title: "网络", image: UIImage(named: "tabbar_net_n"), selectedImage: UIImage(named: "tabbar_net_s"))
        uiNavi.tabBarItem = ESTabBarItem.init(TabbarItemContentView(),title: "UI", image: UIImage(named: "tabbar_uikit_n"), selectedImage: UIImage(named: "tabbar_uikit_s"))
        
        tabBarController.viewControllers = [baseNavi,networkNavi, uiNavi]
        
        return tabBarController
    }
}
