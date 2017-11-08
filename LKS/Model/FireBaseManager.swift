//
//  FireBaseManager.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FBManager {
    
    var ref: DatabaseReference = Database.database().reference()
    
    //FIXME:- complete the method
    
    func putCrewToDataBase(crew: Crew) {
        let crew = Crew(_name: "hello", _nomination: Nomination.bestClassicCrew.rawValue, _league: League.funLeague.rawValue, _ageCategory: AgeCategory.adults.rawValue)
        
        
    }
    
    func getCrewsArrayFromCategory() -> [String]
    {
//        ref.observeSingleEvent(of: .value, with: { snapshot in
//
//            if snapshot.exists() {
//                let dataBase = snapshot.value as! [String: Any]
//                print(dataBase)
//
//                do {
//                    let some = try JSONDecoder().decode(LKS.self, from: dataBase)
//
//                    print("------------------------------")
//                    print(some)
//                }   catch let error {
//                    print(error.localizedDescription)
//                }
//            }
//        })
        return ["hello"]
    }
}
