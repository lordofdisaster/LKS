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

    @IBOutlet weak var nominationImageFromView: UIImageView!
    @IBOutlet weak var nominationImageToView: UIImageView!
    
    @IBOutlet weak var leagueImageFromView: UIImageView!
    @IBOutlet weak var leagueImageToView: UIImageView!
    
    @IBOutlet weak var ageCategoryImgageFromView: UIImageView!
    @IBOutlet weak var ageCategoryImageToView: UIImageView!
    
    @IBOutlet weak var currentCrewName: UILabel!
    
    fileprivate var ranksVC = ranksTableViewController()
    fileprivate var estimationVC = estimationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Name of current Jury is: ", FBManager.shared.juryName)
        
        nominationImageFromView.image = UIImage(named: "WAM_logo")
        
        leagueImageFromView.image = UIImage(named: "WAM_logo")
        
        ageCategoryImgageFromView.image = UIImage(named: "WAM_logo")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       estimationVC.delegateTableUpdater = ranksVC
        print("estimationVC.delegateTableUpdater = ranksVC")
    }

    func updateHeaderInformationFromRemouteConfig() {
        Constants().setupAPP()
        
        nominationImageFromView.image = UIImage(named: Constants().getNewImageContentsForNomination(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.nomination.rawValue)!))
        
        leagueImageFromView.image = UIImage(named: Constants().getNewImageContentsForLeague(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.league.rawValue)!))
        
        ageCategoryImgageFromView.image = UIImage(named: Constants().getNewImageContentsForAge(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.age.rawValue)!))
    }
    
    func updateHeaderInformationFromSelectedCell(_nomination: String, _ageCategory: String, _league: String, _currentCrew: String) {

        let textAnimation = CATransition()
        textAnimation.type = kCATransitionPush;
        textAnimation.duration = 1.7;
        textAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        self.currentCrewName.layer.add(textAnimation, forKey: "changeTextTransition")
        self.currentCrewName.text = _currentCrew
        print("nomination: ", _nomination, "_ageCategory: ", _ageCategory, "_league: ", _league)
        
        let fromViewNomination = nominationImageFromView
        self.nominationImageToView.image = UIImage(named: _nomination)
        UIView.transition(from: fromViewNomination!, to: nominationImageToView, duration: 0.5, options: [.curveEaseOut, .transitionFlipFromLeft, .showHideTransitionViews])
        
        let fromLeagueNomination = leagueImageFromView
        self.leagueImageToView.image = UIImage(named: _league)
        UIView.transition(from: fromLeagueNomination!, to: leagueImageToView, duration: 1, options: [.curveEaseOut, .transitionFlipFromLeft, .showHideTransitionViews])

        let fromAgeCategoryNomination = ageCategoryImgageFromView
        self.ageCategoryImageToView.image = UIImage(named: _ageCategory)
        UIView.transition(from: fromAgeCategoryNomination!, to: ageCategoryImageToView, duration: 1.5, options: [.curveEaseOut, .transitionFlipFromLeft, .showHideTransitionViews])
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
                ranksVC = vc
            }
        }
    }

}
