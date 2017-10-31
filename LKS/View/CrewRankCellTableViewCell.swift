//
//  CrewRankCellTableViewCell.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class CrewRankCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var crewName: UILabel!
    @IBOutlet weak var cewTotalPoints: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
