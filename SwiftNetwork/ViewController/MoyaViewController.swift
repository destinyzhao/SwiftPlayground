//
//  MoyaViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/18.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit


class MoyaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Moya";
    }

    @IBAction func weatherAction(_ sender: Any) {
        weatherAPI()
    }
    /// 基本使用
    func weatherAPI() {
        NetworkApiProvider.request(NetworkAPI.realtimeWeather(cityId: "101040100")) { result in
            if case .success(let response) = result {
               // 解析数据
                let jsonDic = try! response.mapJSON() as! NSDictionary
                self.showAlert(weatherDic: jsonDic)
            }
        }
        
    }
    
    func showAlert(weatherDic:NSDictionary) -> Void {
           let dataDic = weatherDic["weatherinfo"] as! NSDictionary
           let temp = dataDic["temp"] as!String
           let sd = dataDic["SD"] as!String
           
           
           let alertController = UIAlertController(title:"提示",message:"重庆当前温度：\(temp)℃,湿度：\(sd)",preferredStyle: .alert);
           let canceAction = UIAlertAction(title:"取消",style:.cancel,handler:nil);
           let okAciton = UIAlertAction(title:"确定",style:.default,handler: {
               action in
               print("他点击了确定")
           })
           alertController.addAction(canceAction);
           alertController.addAction(okAciton);
           self.present(alertController, animated: true, completion: nil)
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
