//
//  DetailHeaderCell.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 27/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import Foundation
import UIKit

class DetailHeaderCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var starOne: UIImageView!
    @IBOutlet weak var starTwo: UIImageView!
    @IBOutlet weak var starThree: UIImageView!
    @IBOutlet weak var starFour: UIImageView!
    @IBOutlet weak var starFive: UIImageView!
    
    func configure(details: Details?) {
        
        guard let safeDetails = details else { return }
        
        nameLabel.text = safeDetails.name
        ratingLabel.text = "\(safeDetails.review)"
        rating(review: safeDetails.review)
        
        restaurantImage?.image = UIImage(url: URL(string: "https://pt.sonestapiyucay.com/cache/a3/a1/a3a1b928b1029b9dc5921a120819fefc.jpg"))!
    }
    
    func rating(review: Double) {
        
        var imageNameOne: String!
        var imageNameTwo: String!
        var imageNameThree: String!
        var imageNameFour: String!
        var imageNameFive: String!
        
        if ( review >= 0 && review <= 0.5 ) {
            imageNameOne = "smallStarOff"
            imageNameTwo = "smallStarOff"
            imageNameThree = "smallStarOff"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        } else if ( review > 0.5 && review <= 1.5) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOff"
            imageNameThree = "smallStarOff"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        }  else if ( review > 1.5 && review <= 2.5) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOn"
            imageNameThree = "smallStarOff"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        } else if ( review > 2.5 && review <= 3.5) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOn"
            imageNameThree = "smallStarOn"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        }  else if ( review > 3.5 && review < 4.5 ) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOn"
            imageNameThree = "smallStarOn"
            imageNameFour = "smallStarOn"
            imageNameFive = "smallStarOff"
        }  else if ( review >= 4.5 && review <= 5) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOn"
            imageNameThree = "smallStarOn"
            imageNameFour = "smallStarOn"
            imageNameFive = "smallStarOn"
        }
        
        self.starOne?.image = UIImage(named: imageNameOne)
        self.starTwo?.image = UIImage(named: imageNameTwo)
        self.starThree?.image = UIImage(named: imageNameThree)
        self.starFour?.image = UIImage(named: imageNameFour)
        self.starFive?.image = UIImage(named: imageNameFive)
    }
}
