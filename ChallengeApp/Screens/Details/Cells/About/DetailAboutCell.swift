//
//  DetailAboutCell.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 27/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class DetailAboutCell: UITableViewCell {
    
    @IBOutlet weak var aboutLabel: UITextView!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(details: Details) {
        
        aboutLabel.text = details.about
        //hoursLabel.text = details.time
        phoneLabel.text = "\(details.phone)"
        addressLabel.text = "\(details.adress)"
        
    }

}
