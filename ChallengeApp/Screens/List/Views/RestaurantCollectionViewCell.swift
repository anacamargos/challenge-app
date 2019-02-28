//
//  RestaurantCollectionViewCell.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var starOne: UIImageView!
    @IBOutlet weak var starTwo: UIImageView!
    @IBOutlet weak var starThree: UIImageView!
    @IBOutlet weak var starFour: UIImageView!
    @IBOutlet weak var starFive: UIImageView!
    
    func configure(location: Location) {
        
        nameLabel.text = location.name
        typeLabel.text = location.type
        ratingLabel.text = "\(location.review)"
        rating(review: location.review)
        
        imageView.image = UIImage(url: URL(string: "https://pt.sonestapiyucay.com/cache/a3/a1/a3a1b928b1029b9dc5921a120819fefc.jpg"))!
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
        
        self.starOne.image = UIImage(named: imageNameOne)
        self.starTwo.image = UIImage(named: imageNameTwo)
        self.starThree.image = UIImage(named: imageNameThree)
        self.starFour.image = UIImage(named: imageNameFour)
        self.starFive.image = UIImage(named: imageNameFive)
    }
    
}


extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
