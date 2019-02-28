//
//  API.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 28/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import Foundation
import Moya

class API {
    
    
    static func loadDetails(withId id: Int, callBack: @escaping (Details?) -> Void) {
        
        let service = MoyaProvider<HotmartService.ListLocationsProvider>()
        let jsonDecoder = JSONDecoder()
        
        service.request(.details(id: id)) { (result) in
            switch result {
            case .success(let response):
                
                if let details = try? jsonDecoder.decode(Details.self, from: response.data) {
                    callBack(details)
                } else {
                    callBack(nil)
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    static func loadListLocations(callBack: @escaping ([Location]) -> Void)  {
        let service = MoyaProvider<HotmartService.ListLocationsProvider>()
        let jsonDecoder = JSONDecoder()
        
        service.request(.search() ) { (result) in
            switch result {
            case .success(let response):
                
                if let root = try? jsonDecoder.decode(Root.self, from: response.data) {
                    callBack(root.listLocations)
                }
//              let root = try? jsonDecoder.decode(Root.self, from: response.data)
//              self.locations = root?.listLocations ?? []
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
}
