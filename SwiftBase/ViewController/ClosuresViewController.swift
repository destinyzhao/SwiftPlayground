//
//  ClosuresViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/14.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ClosuresViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "闭包";
        self.view.backgroundColor = UIColor.white;
        
        let divide = {(val1: Int, val2: Int) -> Int in
            return val1 / val2
        }
        let result = divide(200, 20)
        print ("result:\(result)")
        
        
        let names = ["T", "E", "D", "S", "B"]
        
        func bacckWards(s1:String,s2:String) ->Bool{
            return s1 > s2
        }
        let reversed = names.sorted(by:bacckWards)
        print("reversed:\(reversed)")
        
        let reversed1 = names.sorted(by:{$0 > $1})
        print("reversed1:\(reversed1)")
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
