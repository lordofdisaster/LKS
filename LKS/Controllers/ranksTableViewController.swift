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
    var crewsWithRates = [[String]]() {
        didSet{
            print("SET")
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInTableView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crewCell", for: indexPath) as! CrewRankCellTableViewCell
        cell.configureCell(labelWidth: self.categoryLabel.frame.width, crews: crewsWithRates[indexPath.row])
        
//        FBManager.shared.getAllCrews { [unowned self] (crewContents, namesCrew) in
//            let test = self.parseFetchedDataFromDB(crewsContents: crewContents, crewName: namesCrew[indexPath.row])
//            cell.configureCell(labelWidth: self.categoryLabel.frame.width, crews: test)
//        }
        return cell
    }
    

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
          showHeader()
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
            print("!!!crewsWithRates!!!",self.crewsWithRates)
            self.tableView.reloadData()
        }
    }

    func parseFetchedDataFromDB(crewsContents: NSDictionary, crewName: String) -> [String] {
        
        var contentsForCell = [String]()

        print("crewsContents: ", crewsContents)
            let crewData = crewsContents.value(forKey: crewName) as! NSDictionary
            let crewScore = crewData.value(forKey: "score") as! NSDictionary
            print("SCORE: ", crewScore)
            
            let nomination = String(describing:crewData.value(forKey: "nomination")!)
            let ageCategory = String(describing:crewData.value(forKey: "ageCategory")!)
            let league = String(describing:crewData.value(forKey: "league")!)
            
            let charachter = String(describing: crewScore.value(forKey: "charachter")!)
            let message = String(describing: crewScore.value(forKey: "message")!)
            let perfomance = String(describing: crewScore.value(forKey: "perfomance")!)
            let technique = String(describing: crewScore.value(forKey: "technique")!)
            let total = String(describing: crewScore.value(forKey: "total")!)
            contentsForCell = [crewName, technique, charachter, perfomance, message, total]
        
            return contentsForCell
    }
    
    func showHeader() {
        let labelWidth = categoryLabel.frame.width / CGFloat(category.count)
        for index in 0..<category.count {
            let rect = CGRect(x: categoryLabel.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
            let label = UILabel.init(frame: rect)
            label.text = category[index]
            label.textAlignment = .center
            categoryLabel.addSubview(label)
        }
    }
    
}
