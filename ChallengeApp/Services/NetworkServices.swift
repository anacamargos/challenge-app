//
//  NetworkServices.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import Foundation
import Moya

enum HotmartService {
    enum ListLocationsProvider: TargetType {
        
        case search()
        case details(id: Int)
        
        var baseURL: URL {
            return URL(string: "https://hotmart-mobile-app.herokuapp.com")!
        }
        
        var path: String {
            switch self  {
            case .search:
                return "/locations"
            case let .details(id):
                return "/locations/\(id)"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case .search():
                return .requestPlain
            case .details:
                return .requestPlain
            }
        }
        
        var headers: [String : String]? {
            return ["Content-Type": "application/json"]
        }
        
    }
}
