//
//  ARCPerson.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/14.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ARCPerson: NSObject {
    var name : String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
