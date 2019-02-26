//
//  Models.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import Foundation

struct Root: Codable {
    let listLocations: [Location]
}

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let review: Double
}

struct Details: Decodable {
    let id: Int
    let name: String
    let review: Double
    let type: String
    let about: String
    let phone: String
    let adress: String
}

