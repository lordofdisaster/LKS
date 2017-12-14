//
//  AdminResultTableViewCell.swift
//  LKS
//
//  Created by Serhii Kyrychenko on 14/12/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class AdminResultTableViewCell: UITableViewCell {
    @IBOutlet weak var crewNameLabel: UILabel!
    
    @IBOutlet weak var holderPlaceForJuryNamesAndRatesLables: UILabel!
    
    
    func createLabelsForPrototype() {
        let labelWidth = holderPlaceForJuryNamesAndRatesLables.frame.width / 3 /*array of jury names*/
        for index in 0..<3 { // /*array of jury names*/
            let rect = CGRect(x: holderPlaceForJuryNamesAndRatesLables.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
            let label = UILabel.init(frame: rect)
            label.text = "0" // category[index]
            //label.tag =
            label.textAlignment = .center
            holderPlaceForJuryNamesAndRatesLables.addSubview(label)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
