//
//  StructViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/21.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import WebKit

class StructViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "类与结构体"
        self.loadWebView()
        
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        
        print("The width of someResolution is \(someResolution.width)")
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        
    }
    
    func loadWebView()  {
        //设置访问的url
        let url = URL(string: "https://www.jianshu.com/p/a8c8e85c9801")
        //根据url创建请求
        let urlRequest = URLRequest(url: url!)
        //加载请求
        webView.load(urlRequest)
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
