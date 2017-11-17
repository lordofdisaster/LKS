//
//  ranksTableViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit


class ranksTableViewController: UITableViewController {
    

    @IBOutlet weak var categoryLabel: UILabel!
    
    fileprivate let category = ["CREW NAME","TECHNIQUE", "CHARACHTER", "PERFOMANCE", "MESSAGE", "TOTAL SCORE"]
    var numberOfRowsInTableView = 0
    var crewsWithRates = [NSDictionary]()

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInTableView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crewCell", for: indexPath) as! CrewRankCellTableViewCell
        cell.configureCell(crews: crewsWithRates[indexPath.row])
        
//        FBManager.shared.getAllCrews { [unowned self] (crewContents, namesCrew) in
//            let test = self.parseFetchedDataFromDB(crewsContents: crewContents, crewName: namesCrew[indexPath.row])
//            cell.configureCell(crews: test)
//        }
        return cell
    }
    

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
      //    showHeader()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadDataWithNewValues()
       
    }
    
    func reloadDataWithNewValues() {
        FBManager.shared.getAllCrews { [unowned self] (crewContents, namesCrew) in
            self.numberOfRowsInTableView = namesCrew.count
            
            for crew in namesCrew {
                self.crewsWithRates.append(self.parseFetchedDataFromDB(crewsContents: crewContents, crewName: crew))
            }
            self.tableView.reloadData()
        }
    }

    func parseFetchedDataFromDB(crewsContents: NSDictionary, crewName: String) -> NSDictionary {
        
        var contentsForCell = NSDictionary()

        
            let crewData = crewsContents.value(forKey: crewName) as! NSDictionary
            let crewScore = crewData.value(forKey: "score") as! NSDictionary
            print("SCORE: ", crewScore)
            print("CrewData",crewData)
            
            let nomination = String(describing:crewData.value(forKey: "nomination")!)
            let ageCategory = String(describing:crewData.value(forKey: "ageCategory")!)
            let league = String(describing:crewData.value(forKey: "league")!)
            
            let charachter = String(describing: crewScore.value(forKey: "charachter")!)
            let message = String(describing: crewScore.value(forKey: "message")!)
            let perfomance = String(describing: crewScore.value(forKey: "perfomance")!)
            let technique = String(describing: crewScore.value(forKey: "technique")!)
            let total = String(describing: crewScore.value(forKey: "total")!)
        
        contentsForCell = ["crewName" : crewName,
                           "technique" : technique,
                           "charachter" : charachter,
                           "perfomance" : perfomance,
                           "message" : message,
                           "total" : total,
                           "nomination" : nomination,
                           "ageCategory" : ageCategory,
                           "league" : league]
        
            return contentsForCell
    }
}
