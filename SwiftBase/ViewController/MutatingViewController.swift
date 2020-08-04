//
//  MutatingViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/4.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class MutatingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "Mutating";
        self.view.backgroundColor = UIColor.white;
        
        var val = Area(length: 3, breadth: 5)
        val.scaleBy(res: 3)
        
        
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
