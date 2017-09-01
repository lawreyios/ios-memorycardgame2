//
//  Card.swift
//  ColourMemory
//
//  Created by Lawrence Tan on 15/5/16.
//  Copyright © 2016 Lawrence Tan. All rights reserved.
//

import Foundation

let kCardBgImageName = "cardBack"

struct Card {
    
    var cardId: Int = -1
    var imageBack : String = ""
    var imageFront : String = ""
    var value : Int = 0
    var flipped : Bool = false
    
    init(valueFront: Int, valueBack: Int){
        
        self.imageFront = "Gem_\(valueFront)"
        self.imageBack = "Card_Back_\(valueBack)"
        
        self.value = valueFront
        
        self.flipped = false
        
    }
    
}
