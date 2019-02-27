//
//  DetailsViewController.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import Moya

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //@IBOutlet weak var detailsView: DetailsView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let service = MoyaProvider<HotmartService.ListLocationsProvider>()
    let jsonDecoder = JSONDecoder()
    
    var detailsData: Details!
    
    var locationId: Int! {
        didSet {
            updateView()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(UINib(nibName: "DetailHeaderCell", bundle: nil), forCellReuseIdentifier: "DetailHeaderCell")
        tableView.register(UINib(nibName: "DetailAboutCell", bundle: nil), forCellReuseIdentifier: "DetailAboutCell")
        tableView.register(UINib(nibName: "DetailPhotoCell", bundle: nil), forCellReuseIdentifier: "DetailPhotoCell")
    }
    
    func updateView() {
        
        // Carregar a lista
        loadDetails(withId: locationId) { (details) in
            
            self.detailsData = details
            debugPrint(self.detailsData)
        }
    }
    
    private func loadDetails(withId id: Int, callBack: @escaping (Details?) -> Void) {
        service.request(.details(id: id)) { [weak self] (result) in
            switch result {
            case .success(let response):
                
                if let details = try? self?.jsonDecoder.decode(Details.self, from: response.data) {
                    print("\n\n\n Details aqui: \(details)")
                    callBack(details)
                    //debugPrint(details)
                } else {
                    //print("Entrei aqui")
                    callBack(nil)
                    
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    // MARK: - table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHeaderCell", for: indexPath) as! DetailHeaderCell
            //cell.configure(details: detailsData)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPhotoCell", for: indexPath) as! DetailPhotoCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAboutCell", for: indexPath) as! DetailAboutCell
            //cell.configure(details: detailsData)
            return cell
        }
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 0
        if indexPath.row == 0 {
            height = 402
        } else if indexPath.row == 1 {
            height = 130
        } else if indexPath.row == 2 {
            height = 360
        }
        return CGFloat(height)
    }
    
}
