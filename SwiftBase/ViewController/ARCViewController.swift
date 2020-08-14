//
//  ARCViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/14.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ARCViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "自动引用计数";
        self.view.backgroundColor = UIColor.white;
        
        var reference1: ARCPerson?
        var reference2: ARCPerson?
        var reference3: ARCPerson?
        
        reference1 = ARCPerson(name:"John Appleseed")
        reference2 = reference1
        reference3 = reference1
        
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
