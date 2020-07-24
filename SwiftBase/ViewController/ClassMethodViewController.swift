//
//  ClassMethodViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/24.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ClassMethodViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "类方法和实例方法";
        self.view.backgroundColor = UIColor.white;
        
        //调用类方法
        let randomNum = ClassMethod.getRandomNum()
        print("randomNum:\(randomNum)")
        
        //调用类方法
        let randomNum1 = ClassMethod.getRandomNum1()
        print("randomNum1:\(randomNum1)")
        
        // 实例方法
        let method = ClassMethod();
        method.instanceMethod(param:"instanceMethod")
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
