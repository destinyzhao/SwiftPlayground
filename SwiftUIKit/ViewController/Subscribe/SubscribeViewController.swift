//
//  SubscribeViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import HandyJSON

class SubscribeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var subscribeList = [SubscribeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "订阅"
        
        setupUI()
        loadData()
    }

    func setupUI() -> Void {
        collectionView.register(cellType: SubscribeCell.self)
        collectionView.register(supplementaryViewType: SubscribeHeader.self, ofKind: UICollectionView.elementKindSectionHeader)
        collectionView.register(supplementaryViewType: SubscribeFooter.self, ofKind: UICollectionView.elementKindSectionFooter)
        
           
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView .setCollectionViewLayout(layout, animated: false)
    }
    
    func loadData() {
        NetworkApiLoadingProvider.request(NetworkAPI.subscribeList) { result in
            if case let .success(response) = result {
                // 解析数据
                let jsonDic = try! response.mapJSON() as! NSDictionary
                let dataDic = jsonDic["data"] as! NSDictionary
                let returnData = dataDic["returnData"] as! NSDictionary
                let subscribeList = returnData["newSubscribeList"] as! NSArray
                
                self.subscribeList = (JSONDeserializer<SubscribeModel>.deserializeModelArrayFrom(array: subscribeList)) as! [SubscribeModel]
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

// 代理
extension SubscribeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return subscribeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        return UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let comicList = subscribeList[section]
        return comicList.comics?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let head = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath, viewType: SubscribeHeader.self)
            let comicList = subscribeList[indexPath.section]
            head.iconView.kf.setImage(urlString: comicList.titleIconUrl, placeholder: nil)
            head.titleLabel.text = comicList.itemTitle

            return head
        } else {
            let foot = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: indexPath, viewType: SubscribeFooter.self)
            return foot
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let comicList = subscribeList[section]
        return comicList.itemTitle?.count ?? 0 > 0 ? CGSize(width: ScreenWidth, height: 44) : CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return subscribeList.count - 1 != section ? CGSize(width: ScreenWidth, height: 10) : CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SubscribeCell = collectionView.dequeueReusableCell(for: indexPath, cellType: SubscribeCell.self)
        let comicList = subscribeList[indexPath.section]
        cell.comicModel = comicList.comics?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(ScreenWidth - 10.0) / 3.0)
        return CGSize(width: width, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
