//
//  RemoteConfig.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 02/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig


class RemoteConfigConfiguration {
    
    static let sharedInstance = RemoteConfigConfiguration()
    
    func setupRemoteConfigDefaults()
    {
        let defaultValues = [
            "imageContents": "" as NSObject
        ]
        RemoteConfig.remoteConfig().setDefaults(defaultValues)
    }
    
    func fetchRemoteConfig() {
        print("-----------fetchRemoteConfig()------------")
        let debugSettings = RemoteConfigSettings(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = debugSettings!
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { (status, error) in
            guard error == nil
            else {
                print("FETCH REMOTE CONFIG ERROR. LOCALIZED DESCRIPTION: ", error?.localizedDescription ?? "UNKNOWN ERROR")
                return
            }
            print("RETRIVED VALUES FROM THE  CLOUD")
            RemoteConfig.remoteConfig().activateFetched()
            self.updateViewWithRCValues()
        }
    }
    
    func updateViewWithRCValues() -> String {
        let imageContents = RemoteConfig.remoteConfig().configValue(forKey: "imageContents").stringValue ?? ""
        return imageContents
        
    }
    
    
    
    
    
    
    
    
}
