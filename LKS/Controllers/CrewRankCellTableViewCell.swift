//
//  CrewRankCellTableViewCell.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class CrewRankCellTableViewCell: UITableViewCell {



    @IBOutlet weak var crewInfo: UILabel!
    
   
  //  let array = FBManager().getCrewsArrayFromCategory()
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configureCell(labelWidth: CGFloat, crews: [String]) {
        
        let labelWidth = labelWidth / CGFloat(crews.count)
        for index in 0..<crews.count {
            let rect = CGRect(x: self.crewInfo.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
            let label = UILabel.init(frame: rect)
            label.text = crews[index]
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            self.crewInfo.addSubview(label)
        }
    }
    

}
