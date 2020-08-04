//
//  GenericsViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/4.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class GenericsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "泛型";
        self.view.backgroundColor = UIColor.white;
        
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        
       print("Min is:", myMin(2, 21))
    }
    
    func swapTwoValues<T>(_ a:inout T,_ b:inout T){
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func myMin<T: Comparable>(_ a:T, _ b: T) -> T {
        return a < b ? a : b
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
