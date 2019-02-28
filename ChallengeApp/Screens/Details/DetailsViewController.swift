//
//  DetailsViewController.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 25/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
//import Moya

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
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
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    func updateView() {
        
        // Carregar a lista
        API.loadDetails(withId: locationId) { (details) in
            self.detailsData = details
            // configurar a celula
            self.tableView.reloadData()

            debugPrint(self.detailsData)
        }
    }
    
    
    // MARK: - table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHeaderCell", for: indexPath) as! DetailHeaderCell
            cell.configure(details: detailsData)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPhotoCell", for: indexPath) as! DetailPhotoCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAboutCell", for: indexPath) as! DetailAboutCell
            cell.configure(details: detailsData)
            return cell
        }
    }
}
