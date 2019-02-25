//
//  Models.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import Foundation

struct Root: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let id: String
    let name: String
    //let imageUrl: URL
    let type: String
    let review: Double
}

struct RestaurantListViewModel {
    let name: String
    //let imageUrl: URL
    let type: String
    let review: Double
    let id: String //ou int?
}

extension RestaurantListViewModel {
    init(business: Business) {
        self.name = business.name
        self.id = business.id
        //self.imageUrl = business.imageUrl
        self.type = business.type
        self.review = business.review
        
    }
}
