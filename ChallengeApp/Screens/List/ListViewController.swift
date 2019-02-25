//
//  ListViewController.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {


    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCollectionViewCell
        

        
        cell.nameLabel.text = "Padaria Pelicano"
        cell.typeLabel.text = "Padaria"
        
        return cell
    }
    


}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let numberOfColumns: CGFloat = 2
            let width = collectionView.frame.size.width
            let xInsets: CGFloat = 10
            let cellSpacing: CGFloat = 5
        
        
         return CGSize(width: ( width/numberOfColumns) - (xInsets + cellSpacing), height: 225)
        }
        
        
    
    }

