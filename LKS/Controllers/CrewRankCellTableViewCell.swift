//
//  CrewRankCellTableViewCell.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class CrewRankCellTableViewCell: UITableViewCell {

    @IBOutlet weak var crewNameLabel: UILabel!
    @IBOutlet weak var techniqueLable: UILabel!
    @IBOutlet weak var charachterLabel: UILabel!
    @IBOutlet weak var perfomanceLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    
    var ageCategory = String()
    var league = String()
    var nomination = String()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(crews: NSDictionary) {
        self.crewNameLabel.text = (crews.value(forKey: "crewName") as! String)
        self.techniqueLable.text = (crews.value(forKey: "technique") as! String)
        self.charachterLabel.text = (crews.value(forKey: "charachter") as! String)
        self.perfomanceLabel.text = (crews.value(forKey: "perfomance") as! String)
        self.messageLabel.text = (crews.value(forKey: "message") as! String)
        self.totalScore.text = (crews.value(forKey: "total") as! String)
        self.league = (crews.value(forKey: "league") as! String)
        self.nomination = (crews.value(forKey: "nomination") as! String)
        self.ageCategory = (crews.value(forKey: "ageCategory") as! String)
    }
    
    func updateRatesForCrewInCell(values: NSDictionary, _totalScore: String) {
        self.messageLabel.text = (values.value(forKey: "MESSAGE") as! String)
        self.charachterLabel.text = (values.value(forKey: "CHARACTER") as! String)
        self.perfomanceLabel.text = (values.value(forKey: "PERFOMANCE") as! String)
        self.techniqueLable.text = (values.value(forKey: "TECHNIQUE") as! String)
        self.totalScore.text = _totalScore
    }
    

}
