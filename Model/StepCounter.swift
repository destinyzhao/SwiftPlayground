//
//  StepCounter.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/21.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class StepCounter: NSObject {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet(oldTotalSteps) {
            print("newValue: \(totalSteps) oldValue: \(oldTotalSteps)")
        }
    }
}
