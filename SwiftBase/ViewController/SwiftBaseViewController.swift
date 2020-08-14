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
    
    let dataArray = ["Hello, World!",
                     "区间运算符",
                     "多行字符串字面量",
                     "数组",
                     "字典",
                     "函数",
                     "类与结构体",
                     "属性",
                     "数组对象排序",
                     "可选链",
                     "类方法和实例方法",
                     "类型转换",
                     "扩展",
                     "Mutating",
                     "泛型",
                     "高阶函数",
                     "自动引用计数",
                     "元祖"
    ]
    
    let classNameArray = ["HelloWorldViewController",
                          "RangeOperatorsViewController",
                          "StringViewController",
                          "ArrayViewController",
                          "DictionaryViewController",
                          "FunctionViewController",
                          "StructViewController",
                          "PropertyViewController",
                          "ArraySortViewController",
                          "OptionalViewController",
                          "ClassMethodViewController",
                          "TypeViewController",
                          "ExtensionViewController",
                          "MutatingViewController",
                          "GenericsViewController",
                          "HigherFunctionViewController",
                          "ARCViewController",
                          "TupleViewController"
    ]
    
    
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
        let pushVC = ViewControllerHelper.getViewControllerWithCalssName(classNameArray[indexPath.row])
        pushVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
}
