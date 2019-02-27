//
//  DetailsViewController.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import Moya

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsView: DetailsView!
    
    let service = MoyaProvider<HotmartService.ListLocationsProvider>()
    let jsonDecoder = JSONDecoder()
    //let detailsData: Details!
    
    var locationId: Int! {
        didSet {
            updateView()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateView() {
        
        // Carregar a lista
        //loadDetails(withId: locationId)
        loadDetails(withId: locationId)
        

        
    }
    
    private func loadDetails(withId id: Int) {
        service.request(.details(id: id)) { [weak self] (result) in
            switch result {
            case .success(let response):
                
                let details = try? self?.jsonDecoder.decode(Details.self, from: response.data)
                //let detailsData = try? Details(from: details as! Decoder)

                self?.detailsView.firstView.nameLabel.text = details!?.name
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
