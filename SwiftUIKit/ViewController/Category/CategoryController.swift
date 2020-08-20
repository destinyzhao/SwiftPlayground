//
//  CollectionViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/19.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import HandyJSON

class CategoryController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var rankList = [RankModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "分类"
        
        setupUI()
        loadData()
    }
    
    
    func setupUI() -> Void {
        
        collectionView.register(cellType: RankCollectionCell.self)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView .setCollectionViewLayout(layout, animated: false)
    }
    
    func loadData() {
        NetworkApiLoadingProvider.request(NetworkAPI.categoryList) { result in
            if case let .success(response) = result {
                // 解析数据
                let jsonDic = try! response.mapJSON() as! NSDictionary
                let dataDic = jsonDic["data"] as! NSDictionary
                let returnData = dataDic["returnData"] as! NSDictionary
                let rankinglist = returnData["rankingList"] as! NSArray
                
                self.rankList = (JSONDeserializer<RankModel>.deserializeModelArrayFrom(array: rankinglist)) as! [RankModel]
            }
            
            self.collectionView.reloadData()
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

extension CategoryController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:RankCollectionCell = collectionView.dequeueReusableCell(for: indexPath, cellType: RankCollectionCell.self)
        if rankList.count > indexPath.row {
            cell.rankModel = rankList[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(ScreenWidth - 12) / 3.0)
        return CGSize(width: width, height: width+20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = rankList[indexPath.row]
        let vc = DetailRankController(argCon: model.argCon,
                                     argName: model.argName,
                                     argValue: model.argValue)
        vc.title = model.sortName
        navigationController?.pushViewController(vc, animated: true)
    }
}

