//
//  DetailPhotoCell.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 27/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class DetailPhotoCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate{


    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!,
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!,
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!,
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!,
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!,
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!,
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!,
        UIImage(url: URL(string: "https://abrilexame.files.wordpress.com/2017/08/thinkstockphotos-174790734.jpg"))!
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //collectionView.register(UINib(nibName: "DetailsPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        self.collectionView.register(UINib(nibName: "DetailsPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! DetailsPhotoCollectionViewCell
        cell.restaurantImageView.image = images[indexPath.row]
        return cell
    }

}
