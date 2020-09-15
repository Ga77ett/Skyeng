//
//  NetworkItems.swift
//
//  Created by Kirill Shalankin on 18/06/2019.
//

import Alamofire

// MARK: - Enums

enum NetworkEnvironment {
    case stage
}

enum RequestItemsType {
    case search
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
        case .stage: return "https://dictionary.skyeng.ru"
        }
    }
    
    var version: String {
        return "/api/public/v1"
    }
    
    var path: String {
        switch self {
        case .search:
            return "/words/search"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.version + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
    }
    
}
