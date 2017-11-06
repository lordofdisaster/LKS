//
//  Constants.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 03/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit
import Firebase

class Constants: NSObject {
    
    var remoteConfig:RemoteConfig!
    enum ValueKey: String {
        case nomination
        case league
        case age
    }
    
    func createDefaults() {
        let defaults : [String: NSObject] = [
            ValueKey.nomination.rawValue : "WAM_logo" as NSObject,
            ValueKey.league.rawValue : "WAM_logo" as NSObject,
            ValueKey.age.rawValue : "WAM_logo" as NSObject
            
        ]
        remoteConfig = RemoteConfig.remoteConfig()
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.configSettings = remoteConfigSettings!
        remoteConfig.setDefaults(defaults)
    }
    
    func setupAPP() {
        createDefaults()
        remoteConfig.fetch(withExpirationDuration: 0) {(status, error) -> Void in
            if (status == RemoteConfigFetchStatus.success) {
                print("SUCCESS! CONFIG HAS BEEN FETCHED")
                self.remoteConfig.activateFetched()
            } else {
                print("FALUIRE")
                print("ERROR", error?.localizedDescription ?? "Undefined localized description")
            }
        }
    }
    
    func getNewImageContentsForNomination(forKey key: ValueKey) -> String {
        createDefaults()
        return self.remoteConfig[key.rawValue].stringValue ?? ""
    }

    func getNewImageContentsForLeague(forKey key: ValueKey) -> String {
        createDefaults()
        return self.remoteConfig[key.rawValue].stringValue ?? ""
    }
    
    func getNewImageContentsForAge(forKey key: ValueKey) -> String {
        createDefaults()
        return self.remoteConfig[key.rawValue].stringValue ?? ""
    }
}
