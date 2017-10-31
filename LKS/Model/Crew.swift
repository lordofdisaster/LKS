//
//  Crew.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 31/10/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import Foundation
class Crew {
    var name = String()
    var comment  = String()
    var score = Score()
    
    init (_name: String,
          _comment: String,
          _technique: Int,
          _charachter: Int,
          _perfomance: Int,
          _message: Int)
    {
        name = _name
        comment = _comment
        score.technique = _technique
        score.charachter = _charachter
        score.perfomance = _perfomance
        score.message = _message
        score.total = _technique + _charachter + _perfomance + _message

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
    

