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
    }
    

}
