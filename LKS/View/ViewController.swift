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
    @IBOutlet weak var legueDescriptiveImage: UIImageView!
    @IBOutlet weak var ageLeagueDescriptiveImage: UIImageView!
    @IBOutlet weak var currentCrewName: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.nominationDescriptiveImage.image = UIImage(named: "WAM_logo")
//        self.ageLeagueDescriptiveImage.image = UIImage(named: "WAM_logo")
//        self.legueDescriptiveImage.image = UIImage(named: "WAM_logo")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func updateHeaderInformation() {
        Constants().setupAPP()
        nominationDescriptiveImage.image = UIImage(named: Constants().getNewImageContents())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToEstimationView" {
            if let vc = segue.destination as? estimationViewController {
                vc.delegate = self
            }
        }
    }
}
