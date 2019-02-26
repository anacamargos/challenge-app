//
//  Models.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import Foundation

struct Root: Codable {
    let listLocations: [ListLocations]
}

struct ListLocations: Codable {
    let id: Int
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
    let id: Int //ou int?
}

extension RestaurantListViewModel {
    init(listLocations: ListLocations) {
        self.name = listLocations.name
        self.id = listLocations.id
        //self.imageUrl = listLocations
        self.type = listLocations.type
        self.review = listLocations.review
        
    }
}
