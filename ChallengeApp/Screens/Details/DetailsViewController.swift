//
//  DetailsViewController.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsView: DetailsView!
    
    var location: Location! {
        didSet {
            updateView()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateView() {
        if let location = location {
            detailsView.firstView.nameLabel.text = location.name
            detailsView.firstView.ratingLabel.text = "\(location.review)"
        }
        
//        if let viewModel = viewModel {
//            detailsView.firstView.nameLabel.text = viewModel.name
//            detailsView.firstView.ratingLabel.text = "\(viewModel.review)"
//
//            detailsView.secondView.aboutLabel.text = viewModel.about
//            detailsView.secondView.phoneLabel.text = viewModel.phone
//            detailsView.secondView.addressLabel.text = viewModel.adress
//            detailsView.imageView.image = UIImage (url: viewModel.imageURL)!
//        }
    }
    
    private func loadDetails(withId id: Int) {
//        service.request(.details(id: id)) { [weak self] (result) in
//            switch result {
//            case .success(let response):
//                guard let strongSelf = self else { return }
//                
//                if let details = try? strongSelf.jsonDecoder.decode(Details.self, from: response.data) {
//                    let detailsViewModel = DetailsViewModel(details: details)
//                    (strongSelf.navigationController?.topViewController as? DetailsViewController)?.viewModel = detailsViewModel
//                }
//                
//                
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
    }
}
