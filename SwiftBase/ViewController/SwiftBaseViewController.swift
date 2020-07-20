//
//  SwiftBaseViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class SwiftBaseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = ["Hello, World!","区间运算符"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
}

extension SwiftBaseViewController:UITableViewDelegate,UITableViewDataSource{
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
        switch indexPath.row {
        case 0:
            let pushVC = HelloWorldViewController()
            pushVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(pushVC, animated: true)
            break
        case 1:
            let pushVC = RangeOperatorsViewController()
            pushVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(pushVC, animated: true)
            break
            
        default:
            break
        }
    }
}
