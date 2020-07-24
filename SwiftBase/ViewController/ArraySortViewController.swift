//
//  ArraySortViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/24.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class ArraySortViewController: UIViewController {
    
    var personList: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "数组对象排序";
        self.view.backgroundColor = UIColor.white;
        
        setupData();
        
        print("------数组排序前:------");
        for person in personList {
            print("name:\(person.name)      age:\(person.age)       address:\(person.addrss)")
        }
        
        personList.sort(by: sorterByPersonAgeDESC)
//        personList.sort { $0.age > $1.age }
        print("------数组排序后:------");
        for person in personList {
            print("name:\(person.name)      age:\(person.age)       address:\(person.addrss)")
        }
        
    }
    
    
    /// 排序方法
    /// - Parameters:
    ///   - p1: Person
    ///   - p2: Person
    /// - Returns: 排序后的数组
   func sorterByPersonAgeDESC(p1:Person, p2:Person) -> Bool {
      return p1.age > p2.age
    }
    
    
    /// 初始化数组
    /// - Returns: 数组
    func setupData() -> Void {
        for _ in 0...20 {
            let index = Int(arc4random() % 100)
            
            let persion = Person();
            persion.name = ("name\(index)")
            persion.age = index
            persion.addrss = ("重庆渝中区大坪街道\(index)")
            personList.append(persion);
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
