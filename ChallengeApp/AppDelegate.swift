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

//    let window = UIWindow()
    var window: UIWindow?
    
    let service = MoyaProvider<HotmartService.ListLocationsProvider>()
    let jsonDecoder = JSONDecoder()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let nav = storyboard.instantiateViewController(withIdentifier: "RestaurantNavigationController") as? UINavigationController
        window!.rootViewController = nav
        loadListLocations()
        
        return true
    }
    
    
    
    func loadListLocations ( ) {
        service.request(.search() ) { (result) in
            switch result {
            case .success(let response):
                let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                let viewModels = root?.listLocations.compactMap(RestaurantListViewModel.init)
                //print(root)
                print("cheguei aqui")
                if let nav = self.window?.rootViewController as? UINavigationController,
                    let restaurantListViewController = nav.topViewController as? ListViewController {
                    restaurantListViewController.viewModels = viewModels ?? []
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    


}

