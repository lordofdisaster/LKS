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
    
    func getAllCrews(result: @escaping (NSDictionary) -> Void)
    {
        ref.child("CREW").observeSingleEvent(of: .value, with: { (snapshot) in

            if snapshot.exists() {
                let crewsContents = snapshot.value as! NSDictionary
                let arrayOfAllCrewsNames: [String] = crewsContents.allKeys as! [String]
                result(crewsContents)
            }
//                    print("----------------")
//                    print("NAME: ", crewName, "nomination: ", nomination, "ageCategory: ", ageCategory, "league: ", league, "charachter: ", charachter,"message: ", message,"perfomance: ", perfomance,"technique: ", technique, "total: ", total)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
