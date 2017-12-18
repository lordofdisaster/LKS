//
//  AdminResultTableViewCell.swift
//  LKS
//
//  Created by Serhii Kyrychenko on 14/12/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

protocol getJuryArray: class {
    func returnJuryArray() -> [String]
}

class AdminResultTableViewCell: UITableViewCell {

    @IBOutlet weak var holderPlaceForJuryNamesAndRatesLables: UILabel!
    let adminRTVC = adminResultsTableViewController()
    weak var resultTVDelegate: getJuryArray?
    var resultTotalRanksDict = [String:UILabel]()
    var juryNames = [String]()
  
    func createLabelsForPrototype(arrayOfJuryNames: [String]) {
        
        let crewNameRect = CGRect(x: self.holderPlaceForJuryNamesAndRatesLables.frame.origin.x, y: 0, width: holderPlaceForJuryNamesAndRatesLables.frame.width, height: 30)
        let crewNameLabel = UILabel.init(frame: crewNameRect)
      
        crewNameLabel.textAlignment = .center
        self.holderPlaceForJuryNamesAndRatesLables.addSubview(crewNameLabel)
        resultTotalRanksDict["crewNameLabel"] = crewNameLabel
        
        let labelWidth = crewNameLabel.frame.width / CGFloat(arrayOfJuryNames.count)
        for index in 0..<arrayOfJuryNames.count {
            let rect = CGRect(x: crewNameLabel.frame.origin.x + crewNameLabel.frame.width + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 30)
            let label = UILabel.init(frame: rect)
         //   label.text = arrayOfJuryNames[index]
            label.textAlignment = .center
            holderPlaceForJuryNamesAndRatesLables.addSubview(label)
            resultTotalRanksDict[arrayOfJuryNames[index]] = label
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resultTVDelegate = adminRTVC
        self.juryNames = FBManager.shared.arrayOfAllNames
        self.juryNames.append("Total")
        createLabelsForPrototype(arrayOfJuryNames: juryNames)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
