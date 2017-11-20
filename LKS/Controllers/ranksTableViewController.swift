//
//  ranksTableViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 27/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

protocol updateHeaderInformationWithCellContents: class {
    func updateHeaderInformationFromSelectedCell(_nomination: String, _ageCategory: String, _league: String, _currentCrew: String)
}

class ranksTableViewController: UITableViewController, updateRanksTable {
  
    @IBOutlet weak var categoryLabel: UILabel!
    
    fileprivate let category = ["CREW NAME","TECHNIQUE", "CHARACHTER", "PERFOMANCE", "MESSAGE", "TOTAL SCORE"]
    fileprivate var numberOfRowsInTableView = 0
    fileprivate var crewsWithRates = [NSDictionary]()
    fileprivate var currentCell = CrewRankCellTableViewCell()
    fileprivate var indexPath = IndexPath()
    
    weak var delegateHeaderUpdater: updateHeaderInformationWithCellContents?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInTableView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crewCell", for: indexPath) as! CrewRankCellTableViewCell
        cell.configureCell(crews: crewsWithRates[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let indexPath = IndexPath(item: rowNumber, section: 0)
//        tableView.reloadRows(at: [indexPath], with: .top)
        
        let indexPath = tableView.indexPathForSelectedRow;
        currentCell = tableView.cellForRow(at: indexPath!) as! CrewRankCellTableViewCell!;
        
        delegateHeaderUpdater?.updateHeaderInformationFromSelectedCell(_nomination: currentCell.nomination, _ageCategory: currentCell.ageCategory, _league: currentCell.league, _currentCrew: currentCell.crewNameLabel.text!)
        
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
    
    func updateTableWithNewValues(_values: [String:String], _totalScore: String) {
        let values = _values as NSDictionary
        let score = _totalScore
      //  self.tableView.rectForRow(at: <#T##IndexPath#>)
        currentCell.updateRatesForCrewInCell(values: values, _totalScore: score)
//        currentCell.messageLabel.text = (values.value(forKey: "MESSAGE") as! String)
//        currentCell.charachterLabel.text = (values.value(forKey: "CHARACTER") as! String)
//        currentCell.perfomanceLabel.text = (values.value(forKey: "PERFOMANCE") as! String)
//        currentCell.techniqueLable.text = (values.value(forKey: "TECHNIQUE") as! String)
//        currentCell.totalScore.text = _totalScore
    }
    
}
