//
//  AlamofireViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/17.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class AlamofireViewController: UIViewController {
    
    let weatherUrl:String = "http://weatherapi.market.xiaomi.com/wtr-v2/temp/realtime?cityId="
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Alamofire";
    }


    @IBAction func weatherAction(_ sender: Any) {
        getWeatherInfo();
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getWeatherInfo() -> Void {
         let parameters = ["cityId":"101040100"];
        Alamofire.request(weatherUrl,method:.get,parameters:parameters,encoding: URLEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success(let json ):
                let jsonDic = json as? NSDictionary
                print(jsonDic! as NSDictionary);
                self.showAlert(weatherDic: jsonDic!)
                
                break
            case .failure(let error):
                print("error:\(error)")
                break
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

}
