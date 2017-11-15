//
//  ViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 02/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, updateHeaderInformationWithRC {

    @IBOutlet weak var nominationDescriptiveImage: UIImageView!
    @IBOutlet weak var leagueDescriptiveImage: UIImageView!
    @IBOutlet weak var ageLeagueDescriptiveImage: UIImageView!
    @IBOutlet weak var currentCrewName: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Name of current Jury is: ", FBManager.shared.juryName)
        _ = FBManager.shared.getAllCrews { result in
            CrewRankCellTableViewCell().parseFetchedDataFromDB(crewsContents: result)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       
    }

    func updateHeaderInformation() {
        Constants().setupAPP()
        
        nominationDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForNomination(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.nomination.rawValue)!))
        
        leagueDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForLeague(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.league.rawValue)!))
        
        ageLeagueDescriptiveImage.image = UIImage(named: Constants().getNewImageContentsForAge(forKey: Constants.ValueKey(rawValue: Constants.ValueKey.age.rawValue)!))
    }
    
//    func createAuthAlert() {
//        let alert = UIAlertController(title: "Authentification", message: "Please enter your name: ", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
//
//            if alert.textFields?.count != nil {
//                let name = alert.textFields![0].text
//                print(name) // NAME OF JURY
//            }
//
//            alert.dismiss(animated: true, completion: nil)
//        }))
//
//        alert.addTextField { (textField : UITextField) -> Void in
//            textField.placeholder = "Name"
//        }
//
//        self.present(alert, animated: true, completion: nil)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToEstimationView" {
            if let vc = segue.destination as? estimationViewController {
                vc.delegate = self
            }
        }
    }
}
