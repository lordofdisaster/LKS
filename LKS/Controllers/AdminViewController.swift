//
//  AdminViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 10/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var nominationSegment: UISegmentedControl!
    @IBOutlet weak var ageCategorySegment: UISegmentedControl!
    @IBOutlet weak var leagueSegment: UISegmentedControl!
    @IBOutlet weak var crewNameTextField: UITextField!
    
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
            print(crew.ageCategory, crew.league, crew.name, crew.nomination, crew.score)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seTitlesForSegmentedControllers()
    }
    
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
    }
    
}
