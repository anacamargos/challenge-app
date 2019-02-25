//
//  AppDelegate.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let service = MoyaProvider<HotmartService.BusinessesProvider>()
    let jsonDecoder = JSONDecoder()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        service.request(.search() ) { (result) in
            switch result {
            case .success(let response):
                print(try? JSONSerialization.jsonObject(with: response.data, options: []))
//                let root = try? self.jsonDecoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
//                print(root)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        return true
    }

    


}

