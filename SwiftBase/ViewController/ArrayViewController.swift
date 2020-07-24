//
//  ArrayViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "数组"
        
        let threeDoubles = Array(repeating: 0.0, count: 3)
        print("threeDoubles:",threeDoubles);
        
        let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        print("anotherThreeDoubles:",anotherThreeDoubles);
        
        let sixDoubles = threeDoubles + anotherThreeDoubles
        print("sixDoubles:",sixDoubles);
        
        var shoppingList = ["Eggs", "Milk"]
        print("shoppingList:",shoppingList);
        print("The shopping list contains \(shoppingList.count) items.")
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        } else {
            print("The shopping list is not empty.")
        }
        
        shoppingList.append("Flour")
         print("shoppingList:",shoppingList);
        
        shoppingList += ["Baking Powder"]
         print("shoppingList:",shoppingList);
        // shoppingList 现在有四项了
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        // shoppingList 现在有七项了
         print("shoppingList:",shoppingList);
        
        //我们可以使用for-in循环来遍历所有数组中的数据项
        for item in shoppingList {
            print(item)
        }
        
        //如果我们同时需要每个数据项的值和索引值，可以使用enumerated()方法来进行数组遍历
        for (index, value) in shoppingList.enumerated() {
            print("Item \(String(index + 1)): \(value)")
        }
        
        let demoArr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
        for item in demoArr.dropFirst() {
         print("item: \(item)")
        }
        
        for item in demoArr.dropFirst(3) {
         print("item: \(item)")
        }
        
        let demoAArr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
        //
        for item in demoAArr.dropLast(3) {
         print("item: \(item)")
        }
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
