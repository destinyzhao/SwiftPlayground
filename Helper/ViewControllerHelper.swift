//
//  ViewControllerHelper.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/24.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ViewControllerHelper: NSObject {
    
    /// 通过ClassName动态创建ViewController
    /// - Parameter className: calssName
    /// - Returns: ViewController
   class func getViewControllerWithCalssName(_ className: String) -> UIViewController {
        
        // 准备工作: 命名空间: 必须指定那个bundle(包)
        // 从Info.plist中获取bundle的名字
        let namespace = Bundle.main.infoDictionary!["CFBundleName"] as! String
        // 0.将控制器的字符串转成控制器类型
        let classFromStr: AnyClass? = NSClassFromString(namespace + "." + className)
        let viewControllerClass = classFromStr as! UIViewController.Type
        // 1.创建控制器对象
        let viewController = viewControllerClass.init()
        
        return viewController;
        
    }

}
