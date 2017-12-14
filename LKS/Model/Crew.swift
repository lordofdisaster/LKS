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
    var nomination: Nomination.RawValue
    var league: League.RawValue
    var ageCategory: AgeCategory.RawValue
    
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
    
    convenience init (name: String,
                      nomination: Nomination.RawValue,
                      league: League.RawValue,
                      ageCategory: AgeCategory.RawValue,
                      technique: String,
                      charachter: String,
                      perfomance: String,
                      message: String,
                      total: String)
    {
        self.init(_name: name, _nomination: nomination, _league: league, _ageCategory: ageCategory)
        score.charachter = Int(charachter)!
        score.message = Int(message)!
        score.perfomance = Int(perfomance)!
        score.technique = Int(technique)!
        score.total = Int(total)!
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


