//
//  ExtensionDouble.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/27.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
