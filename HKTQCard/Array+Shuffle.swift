//
//  Array+Shuffle.swift
//  ColourMemory
//
//  Created by Lawrence Tan on 16/5/16.
//  Copyright © 2016 Lawrence Tan. All rights reserved.
//

import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<8
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
