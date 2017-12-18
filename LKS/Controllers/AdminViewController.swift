//
//  AdminViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 10/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

protocol loadSpecifyedCrews: class {
    func loadParticularCrewStack(nomination: String, league: String, ageCategory: String)
    func reloadDataWithNewValues()
}

class AdminViewController: UIViewController {
    

    @IBOutlet weak var resultJuryRanksHeader: UILabel!
    @IBOutlet weak var nominationSegment: UISegmentedControl!
    @IBOutlet weak var ageCategorySegment: UISegmentedControl!
    @IBOutlet weak var leagueSegment: UISegmentedControl!
    @IBOutlet weak var crewNameTextField: UITextField!

    @IBOutlet weak var nominationSegmentToLoad: UISegmentedControl!
    @IBOutlet weak var ageCategorySegmentToLoad: UISegmentedControl!
    @IBOutlet weak var leagueSegmentToLoad: UISegmentedControl!
    
    
    var crewsStack = [NSDictionary]()
    var ranksTVC = ranksTableViewController()
    var juryNames = [String]()
    
    @IBAction func createCrewButton(_ sender: Any)
    {
        guard let nomination = nominationSegment.titleForSegment(at: nominationSegment.selectedSegmentIndex)
            else {  return  }
        guard let league = leagueSegment.titleForSegment(at: leagueSegment.selectedSegmentIndex)
            else {  return  }
        guard let ageCategory = ageCategorySegment.titleForSegment(at: ageCategorySegment.selectedSegmentIndex)
            else {  return  }
        guard let name = crewNameTextField.text else {  return  }
        
        if name != ""
        {
            let crew = Crew(_name: name, _nomination: nomination, _league: league, _ageCategory: ageCategory)
            print(crew)
           // print(crew.ageCategory, crew.league, crew.name, crew.nomination, crew.score)
            FBManager.shared.putCrewToDataBase(crew: crew)
            
        }
        self.crewNameTextField.text = ""
    }
    
    @IBAction func loadCrewsForSpecifiedParameters(_ sender: UIButton) {
        guard let nomination = nominationSegmentToLoad.titleForSegment(at: nominationSegmentToLoad.selectedSegmentIndex)
            else {  return  }
        guard let league = leagueSegmentToLoad.titleForSegment(at: leagueSegmentToLoad.selectedSegmentIndex)
            else {  return  }
        guard let ageCategory = ageCategorySegmentToLoad.titleForSegment(at: ageCategorySegmentToLoad.selectedSegmentIndex)
            else {  return  }
       //     delegateCrewsLoader?.loadParticularCrewStack(nomination: nomination, league: league, ageCategory: ageCategory)
        

        //
       FBManager.shared.ref.child("CURRENT").removeValue()
            
            for each in crewsStack {
                if (each.value(forKey: "nomination") as! String == nomination && each.value(forKey: "league") as! String == league && each.value(forKey: "ageCategory") as! String == ageCategory)
                {
                    let crew = Crew(_name: each.value(forKey: "crewName") as! String, _nomination: nomination, _league: league, _ageCategory: ageCategory)
                    
                    FBManager.shared.putCrewToDataBaseToParticularStack(crew: crew)
                    print(each.value(forKey: "crewName") as! String)
                    print("=========================END=======================")
                }
        }
        //
        
        
        
       // delegateCrewsLoader?.reloadDataWithNewValues()
        
    }
    weak var delegateCrewsLoader: loadSpecifyedCrews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seTitlesForSegmentedControllers()
        
        let group = DispatchGroup()
        
        group.enter()
       // self.delegateCrewsLoader = ranksTVC
        FBManager.shared.getAllJuryNames { [unowned self] (arrayOfAllJuryNames) in
            self.juryNames = arrayOfAllJuryNames
          //  self.juryNames.append("Total")
            self.showHeaderResult(arrayOfJuryNames: self.juryNames)
            group.leave()
        }
        
        FBManager.shared.getAllCrews { [unowned self] (crewContents, namesCrew) in // set observer for update DB

            for crew in namesCrew {
                group.enter()
                self.crewsStack.append(self.parseFetchedDataFromDB(crewsContents: crewContents, crewName: crew))
                group.leave()
            }
        }
        
        
        group.notify(queue: DispatchQueue.main, execute: {
            for jyry in self.juryNames {
                for crew in self.crewsStack {
                    let crewToAdd = Crew(name: crew["crewName"]! as! String,
                                         nomination: crew["nomination"]! as! Nomination.RawValue,
                                         league: crew["league"]! as! League.RawValue,
                                         ageCategory: crew["ageCategory"]! as! AgeCategory.RawValue,
                                         technique: crew["technique"]! as! String,
                                         charachter: crew["charachter"]! as! String,
                                         perfomance: crew["perfomance"]! as! String,
                                         message: crew["message"]! as! String,
                                         total: crew["total"]! as! String)
                    
                    FBManager.shared.putCrewToDataBaseOnJuryBehlf(crew: crewToAdd, juryName: jyry)
                }
            }
        })
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        FBManager.shared.getAllJuryNames { [unowned self] (arrayOfAllJuryNames) in
//            self.juryNames = arrayOfAllJuryNames
//            self.showHeaderResult(arrayOfJuryNames: arrayOfAllJuryNames)
//        }
//    }
    
    
    
    
    
    func seTitlesForSegmentedControllers()
    {
        nominationSegment.setTitle(Nomination.bestClassicCrew.rawValue, forSegmentAt: 0)
        nominationSegment.setTitle(Nomination.bestSolo.rawValue, forSegmentAt: 1)
        nominationSegment.setTitle(Nomination.bestFolcCrew.rawValue, forSegmentAt: 2)
        nominationSegment.setTitle(Nomination.bestStreetCrew.rawValue, forSegmentAt: 3)
        nominationSegment.setTitle(Nomination.bestExtraordinaryCrew.rawValue, forSegmentAt: 4)
        
        ageCategorySegment.setTitle(AgeCategory.kids.rawValue, forSegmentAt: 0)
        ageCategorySegment.setTitle(AgeCategory.juniors.rawValue, forSegmentAt: 1)
        ageCategorySegment.setTitle(AgeCategory.adults.rawValue, forSegmentAt: 2)
        
        leagueSegment.setTitle(League.funLeague.rawValue, forSegmentAt: 0)
        leagueSegment.setTitle(League.proLeague.rawValue, forSegmentAt: 1)
        
        
        
        nominationSegmentToLoad.setTitle(Nomination.bestClassicCrew.rawValue, forSegmentAt: 0)
        nominationSegmentToLoad.setTitle(Nomination.bestSolo.rawValue, forSegmentAt: 1)
        nominationSegmentToLoad.setTitle(Nomination.bestFolcCrew.rawValue, forSegmentAt: 2)
        nominationSegmentToLoad.setTitle(Nomination.bestStreetCrew.rawValue, forSegmentAt: 3)
        nominationSegmentToLoad.setTitle(Nomination.bestExtraordinaryCrew.rawValue, forSegmentAt: 4)
        
        ageCategorySegmentToLoad.setTitle(AgeCategory.kids.rawValue, forSegmentAt: 0)
        ageCategorySegmentToLoad.setTitle(AgeCategory.juniors.rawValue, forSegmentAt: 1)
        ageCategorySegmentToLoad.setTitle(AgeCategory.adults.rawValue, forSegmentAt: 2)
        
        leagueSegmentToLoad.setTitle(League.funLeague.rawValue, forSegmentAt: 0)
        leagueSegmentToLoad.setTitle(League.proLeague.rawValue, forSegmentAt: 1)
        
        
    }
    
    
    func parseFetchedDataFromDB(crewsContents: NSDictionary, crewName: String) -> NSDictionary {
        
        var contentsForCell = NSDictionary()
        
        
        let crewData = crewsContents.value(forKey: crewName) as! NSDictionary
        let crewScore = crewData.value(forKey: "score") as! NSDictionary
//        print("SCORE: ", crewScore)
//        print("CrewData",crewData)
        
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
    
    func showHeaderResult(arrayOfJuryNames: [String]) {
        var arrayOfJuryNamesWithTotalColumn = arrayOfJuryNames
        arrayOfJuryNamesWithTotalColumn.append("Total")
        let crewNameLabelWidth = resultJuryRanksHeader.frame.width / 2
        let crewNameRect = CGRect(x: resultJuryRanksHeader.frame.origin.x, y: 0, width: crewNameLabelWidth, height: 20)
        let crewNameLabel = UILabel.init(frame: crewNameRect)
        crewNameLabel.text = "Crew name"
        crewNameLabel.textAlignment = .center
        resultJuryRanksHeader.addSubview(crewNameLabel)
        
        let labelWidth = crewNameLabel.frame.width / CGFloat(arrayOfJuryNamesWithTotalColumn.count)
        for index in 0..<arrayOfJuryNamesWithTotalColumn.count {
            let rect = CGRect(x: crewNameLabel.frame.origin.x + crewNameLabel.frame.width + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20)
            let label = UILabel.init(frame: rect)
            label.text = arrayOfJuryNamesWithTotalColumn[index]
            label.textAlignment = .center
            resultJuryRanksHeader.addSubview(label)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResults" {
            if let vc = segue.destination as? adminResultsTableViewController {
                
            }
        }
    }
    
}
