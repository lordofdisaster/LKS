//
//  ViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 02/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nominationDescriptiveImage: UIImageView!
    
    @IBOutlet weak var legueDescriptiveImage: UIImageView!
    
    @IBOutlet weak var ageLeagueDescriptiveImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let RMConfig = RemoteConfigConfiguration()
        RMConfig.setupRemoteConfigDefaults()
        RMConfig.updateViewWithRCValues()
        RMConfig.fetchRemoteConfig()
        
        self.nominationDescriptiveImage.image = UIImage(named: "WAM_logo")
        self.ageLeagueDescriptiveImage.image = UIImage(named: "WAM_logo")
        self.legueDescriptiveImage.image = UIImage(named: "WAM_logo")
    }

}
