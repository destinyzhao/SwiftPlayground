//
//  ComicListModel.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/20.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import HandyJSON

enum ComicType: Int, HandyJSONEnum {
    case none = 0
    case update = 3
    case thematic = 5
    case animation = 9
    case billboard = 11
}

class SubscribeModel: HandyJSON {
    var comicType: ComicType = .none
    var canedit: Bool = false
    var sortId: Int = 0
    var titleIconUrl: String?
    var newTitleIconUrl: String?
    var description: String?
    var itemTitle: String?
    var argCon: Int = 0
    var argName: String?
    var argValue: Int = 0
    var argType: Int = 0
    var comics:[ComicModel]?
    var maxSize: Int = 0
    var canMore: Bool = false
    var hasMore: Bool = false
    var spinnerList: [SpinnerModel]?
    var defaultParameters: DefaultParametersModel?
    var page: Int = 0
    
     required init(){}
}

class SpinnerModel: HandyJSON {
    var argCon: Int = 0
    var name: String?
    var conTag: String?
    
     required init(){}
}

class DefaultParametersModel: HandyJSON {
    var defaultSelection: Int = 0
    var defaultArgCon: Int = 0
    var defaultConTagType: String?
    
     required init(){}
}
