//
//  DictionaryViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
         self.view.backgroundColor = UIColor.white
        self.title = "字典"
        
        var airports:[String:String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
        // 访问字典
        print("The dictionary of airports items:",airports)
        print("The dictionary of airports contains \(airports.count) items.")
        
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        
        // 修改字典
        airports["LHR"] = "London"
        print("The dictionary of airports items:",airports)
        
        airports["LHR"] = "London Heathrow"
        print("The dictionary of airports items:",airports)
        
        // 字典遍历
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        
        
        let airportCodes = [String](airports.keys)
        print("Airport code: \(airportCodes)")

        let airportNames = [String](airports.values)
        print("Airport name: \(airportNames)")
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
