//
//  SwiftNetworkViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/14.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class SwiftNetworkViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = ["Alamofire",
                     "Moya",
                     "Json转对象"
    ]
    
    let classNameArray = ["AlamofireViewController",
                          "MoyaViewController",
                          "JsonToObjectViewController"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
}

extension SwiftNetworkViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.font = UIFont.init(name: "", size: 14.0)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = ViewControllerHelper.getViewControllerWithCalssName(classNameArray[indexPath.row])
        pushVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
}
