//
//  DetailAboutCell.swift
//  ChallengeApp
//
//  Created by Ana Leticia Camargos on 27/02/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class DetailAboutCell: UITableViewCell {
    
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(details: Details?) {
        
        guard let safeDetails = details else { return }
        aboutLabel.text = safeDetails.about
        let font = UIFont(name: "Helvetica", size: 16.0)
        var height = heightForView(text: safeDetails.about, font: font!, width: aboutLabel.frame.width)
        aboutLabel.frame.size.height = height
        aboutLabel.sizeToFit()
        print(height)
        
        let hoursText = setHours(schedule: (safeDetails.schedule))
        height = heightForView(text: hoursText, font: font!, width: hoursLabel.frame.width)
        hoursLabel.text = hoursText
        hoursLabel.frame.size.height = height
        hoursLabel.sizeToFit()
        print(height)
        
        phoneLabel.text = "\(safeDetails.phone)"
        addressLabel.text = "\(safeDetails.adress)"
    }

    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(0, 0, width, CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
    
    func setHours(schedule: Schedule) -> String{
        var mondayLabel: String = ""
        var tuesdayLabel: String = ""
        var wednesdayLabel: String = ""
        var thursdayLabel: String = ""
        var fridayLabel: String = ""
        var saturdayLabel: String = ""
        var sundayLabel: String = ""
        
        if schedule.monday != nil {
            mondayLabel = "Segunda de \(schedule.monday!.open) ate \(schedule.monday!.close)\n"
        }
        if schedule.tuesday != nil {
            tuesdayLabel = "Terça de \(schedule.tuesday!.open) ate \(schedule.tuesday!.close)\n"
        }
        if schedule.wednesday != nil {
            wednesdayLabel = "Quarta de \(schedule.wednesday!.open) ate \(schedule.wednesday!.close)\n"
        }
        if schedule.tuesday != nil {
            thursdayLabel = "Quinta de \(schedule.thursday!.open) ate \(schedule.thursday!.close)\n"
        }
        if schedule.friday != nil {
            fridayLabel = "Sexta de \(schedule.friday!.open) ate \(schedule.friday!.close)\n"
        }
        if schedule.saturday != nil {
            saturdayLabel = "Sabado de \(schedule.saturday!.open) ate \(schedule.saturday!.close)\n"
        }
        if schedule.sunday != nil {
            sundayLabel = "Domingo de \(schedule.sunday!.open) ate \(schedule.sunday!.close)\n"
        }

        let label = mondayLabel + tuesdayLabel + wednesdayLabel + thursdayLabel + fridayLabel + saturdayLabel + sundayLabel
        return label
    }

}

extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x:x,y:y,width:width,height:height)
    }
    
}
