//
//  PlayerScore.swift
//  ColourMemory
//
//  Created by 2359 Lawrence on 16/5/16.
//  Copyright © 2016 Lawrence Tan. All rights reserved.
//

import Foundation

struct PlayerScore {
    
    var name : String? = ""
    var score : Int? = 0
    
    init(name: String, score: Int){
        
        self.name = name
        self.score = score
        
    }
    
}