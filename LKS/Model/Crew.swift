//
//  Crew.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import Foundation
class Crew
{
    var name = String()
    var score = Score()
    var nomination: String
    var league: String
    var ageCategory: String
    
    init (_name: String,
          _nomination: Nomination.RawValue,
          _league: League.RawValue,
          _ageCategory: AgeCategory.RawValue)
    {
        name = _name
        nomination = _nomination
        league = _league
        ageCategory = _ageCategory
    }
}

struct Score
{
    var technique = 0
    var charachter = 0
    var perfomance = 0
    var message = 0
    var total = 0
}

enum Nomination: String
{
    case bestStreetCrew = "Best Street Crew"
    case bestClassicCrew = "Best Classic Crew"
    case bestFolcCrew = "Best Folc Crew"
    case bestExtraordinaryCrew = "Best Extraordinary Crew"
    case bestSolo = "Best Solo"
}


enum League: String
{
    case funLeague = "Fun League"
    case proLeague = "Pro League"
}

enum AgeCategory: String
{
    case kids = "Kids"
    case juniors = "Juniors"
    case adults = "Adults"
}


