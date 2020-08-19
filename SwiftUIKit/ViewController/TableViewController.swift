//
//  TableViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/19.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import HandyJSON

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var argCon: Int = 0
    var argName: String?
    var argValue: Int = 0
    var page: Int = 1
    var comicList = [ComicModel]()
    var spinnerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        loadData(more: false)
    }
    
    convenience init(argCon: Int = 0, argName: String?, argValue: Int = 0) {
           self.init()
           self.argCon = argCon
           self.argName = argName
           self.argValue = argValue
       }
    
    func setupUI() -> Void {
          self.tableView.register(UINib (nibName: "ComicCell", bundle: nil), forCellReuseIdentifier: "ComicCell")
      }


    func loadData(more: Bool) {
           page = (more ? ( page + 1) : 1)
           NetworkApiLoadingProvider.request(NetworkAPI.comicList(argCon: argCon, argName: argName ?? "", argValue: argValue, page: page)) { [weak self] (result) in
            if case let .success(response) = result {
                   // 解析数据
                   let jsonDic = try! response.mapJSON() as! NSDictionary
                   let dataDic = jsonDic["data"] as! NSDictionary
                   let returnData = dataDic["returnData"] as! NSDictionary
                   let comicsList = returnData["comics"] as! NSArray
                let defaultParametersDic = returnData["defaultParameters"] as! NSDictionary
                     
                self!.comicList = (JSONDeserializer<ComicModel>.deserializeModelArrayFrom(array: comicsList)) as! [ComicModel]
                
                self?.argCon = defaultParametersDic["defaultArgCon"] as! Int
                self?.spinnerName = (defaultParametersDic["defaultConTagType"] as! String)
                
            }
            self?.tableView.reloadData()
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

extension TableViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:ComicCell = tableView.dequeueReusableCell(for: indexPath, cellType: ComicCell.self)
        if comicList.count > indexPath.row{
            cell.spinnerName = spinnerName
            cell.indexPath = indexPath
            cell.comicModel = comicList[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScreenWidth * 0.4;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
}
