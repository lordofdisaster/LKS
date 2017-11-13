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
    
    var ref: DatabaseReference = Database.database().reference()
    private init() { }
    static let shared = FBManager()
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
    
    func getCrewsArrayFromCategory() -> [Crew]
    {

        return []
    }
}
