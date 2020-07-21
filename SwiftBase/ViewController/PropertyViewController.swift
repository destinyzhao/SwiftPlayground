//
//  PropertyViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/21.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // the range represents integer values 0, 1, and 2
        rangeOfThreeItems.firstValue = 6
        // the range now represents integer values 6, 7, and 8

        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
