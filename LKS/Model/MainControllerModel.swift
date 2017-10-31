//
//  MainControllerModel.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import Foundation

struct Estimation {
    var grades = [String]()
    var category = [String]()
    
    init()
    {
        grades = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
        category = ["TECHNIQUE", "CHARACHTER", "PERFOMANCE", "MESSAGE"]
    }
}

