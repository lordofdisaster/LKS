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

    let array = ["1","2","3","4","5","6"]

    override func awakeFromNib() {
        super.awakeFromNib()
         showCathegory()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func showCathegory() {
        let labelWidth = crewName.frame.width / CGFloat(array.count)
        for index in 0..<array.count {
            let rect = CGRect(x: crewName.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
            let label = UILabel.init(frame: rect)
            label.text = array[index]
            label.textAlignment = .center
            crewName.addSubview(label)
        }
    }
    

}
