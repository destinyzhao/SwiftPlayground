//
//  ExtensionViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/27.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ExtensionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "扩展";
        self.view.backgroundColor = UIColor.white;
        
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        // Prints "One inch is 0.0254 meters"
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        // Prints "Three feet is 0.914399970739201 meters"
        
        let aMarathon = 42.km + 195.m
        print("A marathon is \(aMarathon) meters long")
        // Prints "A marathon is 42195.0 meters long"
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
