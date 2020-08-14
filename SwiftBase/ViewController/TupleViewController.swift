//
//  TupleViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/14.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class TupleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "元祖";
        self.view.backgroundColor = UIColor.white;
        
        let error501 = (501, "Not implemented")
        
        print("The code is:\(error501.0)")
        print("The definition of error is:\(error501.1)")
        
        let error404 = (errorCode: 404, description: "Not Found")
        print(error404.errorCode)
        
        let arr = [1, 2, 3]
        let dic = ["key1": "value1", "key2": "value2","key3":"value3"]
        let anyData = (arr,dic)
        print("数组元素:\(anyData.0[0])")
        print("字典元素:\(anyData.1["key1"]!) ")
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
