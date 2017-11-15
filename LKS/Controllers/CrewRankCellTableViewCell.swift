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
    
    func parseFetchedDataFromDB(crewsContents: NSDictionary) {
        
        let arrayOfAllCrewsNames: [String] = crewsContents.allKeys as! [String]
        for crew in arrayOfAllCrewsNames {

            let crewName = String(crew)
            print("++++++++++++++++++++++++++++", crewsContents)
//            let crewContents = value.value(forKey: crewName) as! NSDictionary
            let crewData = crewsContents.value(forKey: crewName) as! NSDictionary
            let crewScore = crewData.value(forKey: "score") as! NSDictionary
            print("SCORE_SCORE_SCORE_SCORE: ", crewScore)

            let nomination = String(describing:crewData.value(forKey: "nomination"))
            let ageCategory = String(describing:crewData.value(forKey: "ageCategory"))
            let league = String(describing:crewData.value(forKey: "league"))

            let charachter = String(describing: crewScore.value(forKey: "charachter"))
            let message = String(describing: crewScore.value(forKey: "message"))
            let perfomance = String(describing: crewScore.value(forKey: "perfomance"))
            let technique = String(describing: crewScore.value(forKey: "technique"))
            let total = String(describing: crewScore.value(forKey: "total"))

            print("performance:", perfomance, "ageCategory:", ageCategory)
        }
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
