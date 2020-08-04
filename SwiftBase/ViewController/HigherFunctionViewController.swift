//
//  HigherFunctionViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/4.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class HigherFunctionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "高阶函数";
        self.view.backgroundColor = UIColor.white;
        
        //将Int数组转换为String数组
        //$0代表数组的元素
        let array = [1, 2, 3, 4, 5 , 6, 7]
        let result = array.map{
          $0 * 2
        }
        print("result:",result);
        
        let filtrArray = [1, 2, 3, 4, 5 , 6, 7]
        let result2 = filtrArray.filter{
          $0 > 5
        }
        print("result2:",result2);
        
        let result3 = array.reduce(10){
          $0 + $1
        }
        print("result3:",result3);
        
         let result4 = array.reduce(""){$0 + "\($1)"}// 转换为字符串并拼接
         print("result4:",result4);
        
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
