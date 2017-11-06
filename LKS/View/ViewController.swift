//
//  ViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 02/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, updateHeaderInformationWithRC {

    @IBOutlet weak var nominationDescriptiveImage: UIImageView!
    @IBOutlet weak var leagueDescriptiveImage: UIImageView!
    @IBOutlet weak var ageLeagueDescriptiveImage: UIImageView!
    @IBOutlet weak var currentCrewName: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateHeaderInformation() {
        Constants().setupAPP()
        
        nominationDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForNomination(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.nomination.rawValue)!))
        
        leagueDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForLeague(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.league.rawValue)!))
        
        ageLeagueDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForAge(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.age.rawValue)!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToEstimationView" {
            if let vc = segue.destination as? estimationViewController {
                vc.delegate = self
            }
        }
    }
}
