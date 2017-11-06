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
    
    func updateInfo()
    {
        
    }
    
    func getCrewsArrayFromCategory() -> [String]
    {
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if snapshot.exists() {
                let dataBase = snapshot.value as? [String:AnyObject]
                print(dataBase)
            }
//            if let userName = snapshot.value["full_name"] as? String {
//                print(userName)
//            }
//            if let email = snapshot.value["email"] as? String {
//                print(email)
//            }
            
            // can also use
            // snapshot.childSnapshotForPath("full_name").value as! String
        })
        
        
        
        
        return ["hello"]
    }
}
