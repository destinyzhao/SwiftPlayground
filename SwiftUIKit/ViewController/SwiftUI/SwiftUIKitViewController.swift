//
//  SwiftUIKitViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class SwiftUIKitViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = ["CollectionView(分类)",
                     "CollectionView(订阅)"
           ]
           
    let classNameArray = ["CategoryController",
                          "SubscribeViewController"
           ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
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

extension SwiftUIKitViewController:UITableViewDelegate,UITableViewDataSource{
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

