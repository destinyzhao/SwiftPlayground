//
//  JsonToObjectViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/19.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import HandyJSON
import Reusable

class JsonToObjectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
     
    var rankList = [RankModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Json转对象";
        setupUI()
        loadData()
    }
    
    func setupUI() -> Void {
        self.tableView.register(UINib (nibName: "RankCell", bundle: nil), forCellReuseIdentifier: "RankCell")
    }

   func loadData() {
    NetworkApiLoadingProvider.request(NetworkAPI.rankList) { result in
        if case let .success(response) = result {
            // 解析数据
            let jsonDic = try! response.mapJSON() as! NSDictionary
            let dataDic = jsonDic["data"] as! NSDictionary
            let returnData = dataDic["returnData"] as! NSDictionary
            let rankinglist = returnData["rankinglist"] as! NSArray
          
            self.rankList = (JSONDeserializer<RankModel>.deserializeModelArrayFrom(array: rankinglist)) as! [RankModel]
        }

           self.tableView.reloadData()
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

extension JsonToObjectViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:RankCell = tableView.dequeueReusableCell(for: indexPath, cellType: RankCell.self)
        if rankList.count > indexPath.row{
            cell.rankModel = rankList[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScreenWidth * 0.4;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
}

