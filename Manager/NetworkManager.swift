//
//  NetworkManager.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/8/18.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit
import Moya
import HandyJSON

// NetworkAPI就是一个遵循TargetType协议的枚举
let NetworkProvider = MoyaProvider<NetworkAPI>()

enum NetworkAPI {
    // 实时天气
    case realtimeWeather(cityId:String)
}

extension NetworkAPI:TargetType{
    public var baseURL: URL{
        switch self {
        case .realtimeWeather:
            return URL(string: "http://weatherapi.market.xiaomi.com/wtr-v2/temp/realtime?cityId=")!
        }
    }
    
    // 对应的不同API path
    var path: String {
        switch self {
        case .realtimeWeather: return ""
        }
    }
    
    // 请求类型
    public var method: Moya.Method {
        return .get
    }
    
    // 请求任务事件（这里附带上参数）
    public var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {

        case .realtimeWeather(let cityId):
            parmeters = ["cityId":cityId] as [String : Any]
            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
        }
    }
    
    // 是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    // 这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    // 请求头
    public var headers: [String: String]? {
        return nil
    }
}

