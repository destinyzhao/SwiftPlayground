//
//  Area.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/4.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

struct Area {
    var length = 0
    var breadth = 0
    
    func area() -> Int {
        return length * breadth
    }
    
    mutating func scaleBy(res: Int) {
        length *= res
        breadth *= res
        
        print("length:\(length)","breadth:\(breadth)")
        print("area:",area());
    }
    
}
