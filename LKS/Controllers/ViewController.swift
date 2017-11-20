//
//  ViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 02/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, updateHeaderInformationWithRC, updateHeaderInformationWithCellContents {

    @IBOutlet weak var nominationDescriptiveImage: UIImageView!
    @IBOutlet weak var leagueDescriptiveImage: UIImageView!
    @IBOutlet weak var ageCategoryDescriptiveImage: UIImageView!
    @IBOutlet weak var currentCrewName: UILabel!
    
    var ranksVC = ranksTableViewController()
    var estimationVC = estimationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Name of current Jury is: ", FBManager.shared.juryName)
        
        nominationDescriptiveImage.image = UIImage(named: "WAM_logo")
        
        leagueDescriptiveImage.image = UIImage(named: "WAM_logo")
        
        ageCategoryDescriptiveImage.image = UIImage(named: "WAM_logo")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       estimationVC.delegateTableUpdater = ranksVC
        print("estimationVC.delegateTableUpdater = ranksVC")
    }

    func updateHeaderInformationFromRemouteConfig() {
        Constants().setupAPP()
        
        nominationDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForNomination(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.nomination.rawValue)!))
        
        leagueDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForLeague(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.league.rawValue)!))
        
        ageCategoryDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForAge(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.age.rawValue)!))
    }
    
    func updateHeaderInformationFromSelectedCell(_nomination: String, _ageCategory: String, _league: String, _currentCrew: String) {
        self.currentCrewName.text = _currentCrew
        print("nomination: ", _nomination, "_ageCategory: ", _ageCategory, "_league: ", _league)
        
        nominationDescriptiveImage.image = UIImage(named: _nomination)
        leagueDescriptiveImage.image = UIImage(named: _league)
        ageCategoryDescriptiveImage.image = UIImage(named: _ageCategory)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToEstimationView" {
            if let vc = segue.destination as? estimationViewController {
                vc.delegateHeaderUpdater = self
                vc.delegateTableUpdater = ranksVC
            }
        }
        
        if segue.identifier == "ranksSegue" {
            if let vc = segue.destination as? ranksTableViewController {
                vc.delegateHeaderUpdater = self
                
            }
        }
    }
    
}
