//
//  MineController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import ParallaxHeader

class MineController: BaseViewController, UINavigationControllerDelegate {
    
    
    private lazy var myArray: Array = {
        return [
            [["icon":"mine_accout", "title": "消费记录"],
             ["icon":"mine_subscript", "title": "我的订阅"],
             ["icon":"mine_seal", "title": "封印图"]],
            
            [["icon":"mine_message", "title": "消息"],
             ["icon":"mine_cashew", "title": "商城"],
             ["icon":"mine_freed", "title": "在线阅读免流量"]],
            
            [["icon":"mine_feedBack", "title": "帮助中心"],
             ["icon":"mine_mail", "title": "反馈"],
             ["icon":"mine_judge", "title": "评分"],
             ["icon":"mine_author", "title": "成为作者"],
             ["icon":"mine_setting", "title": "设置"]]]
    }()
    
    private lazy var head: MineHeaderView = {
        return MineHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight*0.3))
    }()
    
    private lazy var navigationBarY: CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    lazy var tableView: UITableView = {
           let tableView = UITableView(frame: .zero, style: .plain)
           tableView.backgroundColor = UIColor.background
           tableView.delegate = self
           tableView.dataSource = self
           tableView.register(cellType: MineCell.self)
           return tableView
       }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
    }
    
  override func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {(make) in
            make.edges.equalTo(self.view.snp.edges).priority(.low)
            make.top.equalToSuperview()
        }
        
        tableView.parallaxHeader.view = head
        tableView.parallaxHeader.height = 200
        tableView.parallaxHeader.minimumHeight = navigationBarY
        tableView.parallaxHeader.mode = .fill
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.barStyle(.clear)
        tableView.contentOffset = CGPoint(x: 0, y: -tableView.parallaxHeader.height)
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

extension MineController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= -(scrollView.parallaxHeader.minimumHeight) {
            navigationController?.barStyle(.theme)
            navigationItem.title = "我的"
        } else {
            navigationController?.barStyle(.clear)
            navigationItem.title = ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myArray[section]
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MineCell.self)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        let sectionArray = myArray[indexPath.section]
        let dict: [String: String] = sectionArray[indexPath.row]
        cell.iconView?.image =  UIImage(named: dict["icon"] ?? "")
        cell.titleLabel?.text = dict["title"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

