//
//  FireBaseManager.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class FBManager {
    
    static let shared = FBManager()
    private init() { }

    var ref: DatabaseReference = Database.database().reference()
    var juryName = String()
    
    
    func putCrewToDataBase(crew: Crew)
    {
        self.ref.child("CREW/" + crew.name).setValue(["nomination": crew.nomination,
                                            "ageCategory": crew.ageCategory,
                                            "league": crew.league])
        
        self.ref.child("CREW/" + crew.name + "/score").setValue(["technique": crew.score.technique,
                                                       "charachter": crew.score.charachter,
                                                       "perfomance": crew.score.perfomance,
                                                       "message": crew.score.message,
                                                       "total": crew.score.total])
    }
    
    func putCrewToDataBaseToParticularStack(crew: Crew)
    {
        self.ref.child("CURRENT/" + crew.name).setValue(["nomination": crew.nomination,
                                                      "ageCategory": crew.ageCategory,
                                                      "league": crew.league])
        
        self.ref.child("CURRENT/" + crew.name + "/score").setValue(["technique": crew.score.technique,
                                                                 "charachter": crew.score.charachter,
                                                                 "perfomance": crew.score.perfomance,
                                                                 "message": crew.score.message,
                                                                 "total": crew.score.total])
    }
    
    func putCrewToDataBaseOnJuryBehlf(crew: Crew, juryName: String)
    {
        self.ref.child(juryName + "/" + crew.name).setValue(["nomination": crew.nomination,
                                                         "ageCategory": crew.ageCategory,
                                                         "league": crew.league])
        
        self.ref.child(juryName + "/" + crew.name + "/score").setValue(["technique": crew.score.technique,
                                                                    "charachter": crew.score.charachter,
                                                                    "perfomance": crew.score.perfomance,
                                                                    "message": crew.score.message,
                                                                    "total": crew.score.total])
    }
    
    
    
    func getAllCrews(result: @escaping (NSDictionary, [String]) -> Void)
    {
        ref.child("CREW").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                let crewsContents = snapshot.value as! NSDictionary
                let arrayOfAllCrewsNames: [String] = crewsContents.allKeys as! [String]
                result(crewsContents, arrayOfAllCrewsNames)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func getCurrentCrews(result: @escaping (NSDictionary, [String]) -> Void)
    {
        ref.child("CURRENT").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                let crewsContents = snapshot.value as! NSDictionary
                let arrayOfAllCrewsNames: [String] = crewsContents.allKeys as! [String]
                result(crewsContents, arrayOfAllCrewsNames)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
//    func observeCrews(){
//        
//        ref.child("CURRENT").observe(.value, with: { (snapshot) in
//            print("=========OBSERVE CREWS==========",snapshot)
//            self.dataReloaderDelegate?.reloadDataWithNewValues()
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//    }

    
}
