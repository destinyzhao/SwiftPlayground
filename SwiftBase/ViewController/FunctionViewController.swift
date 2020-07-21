//
//  FunctionViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/21.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import WebKit

class FunctionViewController: UIViewController {
    
    var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "函数"
        
        webView = WKWebView(frame: CGRect(x: 0, y: 40, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 40))
        self.view.addSubview(webView)
        //设置访问的url
        let url = URL(string: "https://www.jianshu.com/p/c5ff695d8182")
        //根据url创建请求
        let urlRequest = URLRequest(url: url!)
        //加载请求
        webView.load(urlRequest)
        
        print(sayHelloWorld())
    }
    
    
    /// 无参函数
    /// - Returns: String
    func sayHelloWorld() -> String {
        return "hello, world"
    }
    //print(sayHelloWorld())
    
    
    /// 有参函数
    /// - Parameter person: person
    /// - Returns: String
    func greet(person:String) -> String {
        let greeting = "Hello,"+person+"!"
        return greeting;
        
    }
    //print(greet(person: "Anna"))
    // 打印 "Hello, Anna!"
    //print(greet(person: "Brian"))
    // 打印 "Hello, Brian!"
    
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    //print(greetAgain(person: "Anna"))
    // 打印 "Hello again, Anna!"
    
    
    /// 多惨返回函数
    /// - Parameters:
    ///   - person: person
    ///   - alreadyGreeted: alreadyGreeted
    /// - Returns: String
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        } else {
            return greet(person: person)
        }
    }
    //print(greet(person: "Tim", alreadyGreeted: true))
    // 打印 "Hello again, Tim!"
    
    
    /// 无返回值函数
    /// - Parameter person: person
    func greet(person: String) {
        print("Hello, \(person)!")
    }
    //greet(person: "Dave")
    
    
    /// 多重返回值
    /// - Parameter array: array
    /// - Returns: tuple
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    /*
     if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
     print("min is \(bounds.min) and max is \(bounds.max)")
     }
     */
    
    
    /// 指定参数标签
    /// - Parameters:
    ///   - person: person
    ///   - hometown: hometown
    /// - Returns: String
    func greetHometown(person: String, from hometown: String) -> String {
        return "Hello \(person)! Glad you could visit from \(hometown)."
    }
    
    
    /// 忽略参数标签
    /// - Parameters:
    ///   - firstParameterName: firstParameterName
    ///   - secondParameterName: secondParameterName
    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
        // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    }
    //someFunction(1, secondParameterName: 2)
    
    
    /// 默认参数值
    /// - Parameters:
    ///   - parameterWithoutDefault: parameterWithoutDefault
    ///   - parameterWithDefault: parameterWithDefault
    func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
    }
    
    
    /// 可变参数
    /// - Parameter numbers: numbers
    /// - Returns: Double
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    /*
     arithmeticMean(1, 2, 3, 4, 5)
     // 返回 3.0, 是这 5 个数的平均数。
     arithmeticMean(3, 8.25, 18.75)
     // 返回 10.0, 是这 3 个数的平均数。
     */
    
    //someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
    //someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
