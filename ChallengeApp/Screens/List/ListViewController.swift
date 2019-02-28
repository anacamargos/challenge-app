//
//  ListViewController.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import Moya

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    let service = MoyaProvider<HotmartService.ListLocationsProvider>()
//    let jsonDecoder = JSONDecoder()
    
    var locations = [Location] ( ) {
        didSet  {
            collectionView.reloadData()
        }
    }
    var selectedLocationId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        //layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        //layout.minimumLineSpacing = 5
        //layout.itemSize = CGSize(width: 170, height: 252)
        
        //self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 0)
        
        //Carregar a lista
        API.loadListLocations { (location) in
            self.locations = location
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let vc = segue.destination as! DetailsViewController
            vc.locationId = selectedLocationId
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedLocationId = locations[indexPath.row].id
        self.performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCollectionViewCell
        let location = locations[indexPath.row]
        //print("\n\n\n \(location)")
        cell.configure(location: location)
        
        cell.contentView.layer.cornerRadius = 16
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfColumns: CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 10
        let cellSpacing: CGFloat = 10

        return CGSize(width: (width/numberOfColumns) - (xInsets + cellSpacing) , height: 252)
        //return CGSize(width: 150, height: 252)
    }
}

