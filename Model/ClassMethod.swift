//
//  ClassMethod.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/24.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ClassMethod: NSObject {
    
    /// 生成一个1~365的随机数 包括1和365
    ///
    /// - Returns: 随机生成的数
    class func getRandomNum() -> NSInteger {
        let randomNum = NSInteger(arc4random()%365) + 1;
        return randomNum;
    }
    
    /// static也可以声明类方法 但是static和class只能用一个
    /// 生成一个1~365的随机数 包括1和365
    ///
    /// - Returns: 随机生成的数
    static func getRandomNum1() -> NSInteger {
        let randomNum = NSInteger(arc4random()%365) + 1;
        return randomNum;
    }
    
    //有1个参数 无返回值
    func instanceMethod(param : String) -> Void {
        print(param);
    }
    
}
