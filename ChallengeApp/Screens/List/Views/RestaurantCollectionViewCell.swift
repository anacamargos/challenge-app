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
    
    func configure (with viewModel: RestaurantListViewModel) {
        //imageView.af_setImage(withURL: viewModel.imageUrl)
        nameLabel.text = viewModel.name
        typeLabel.text = viewModel.type
        ratingLabel.text = "\(viewModel.review)"
        
        rating(review: viewModel.review)
    }
    
    func rating(review: Double) {
        
        var imageNameOne: String!
        var imageNameTwo: String!
        var imageNameThree: String!
        var imageNameFour: String!
        var imageNameFive: String!
        
        if ( review < 1 ) {
            imageNameOne = "smallStarOff"
            imageNameTwo = "smallStarOff"
            imageNameThree = "smallStarOff"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        } else if ( review >= 1 && review < 2) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOff"
            imageNameThree = "smallStarOff"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        } else if ( review >= 2 && review < 3) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOn"
            imageNameThree = "smallStarOff"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        } else if ( review >= 3 && review < 4) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOn"
            imageNameThree = "smallStarOn"
            imageNameFour = "smallStarOff"
            imageNameFive = "smallStarOff"
        } else if ( review >= 4 && review < 5) {
            imageNameOne = "smallStarOn"
            imageNameTwo = "smallStarOn"
            imageNameThree = "smallStarOn"
            imageNameFour = "smallStarOn"
            imageNameFive = "smallStarOff"
        }else if ( review == 5) {
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
