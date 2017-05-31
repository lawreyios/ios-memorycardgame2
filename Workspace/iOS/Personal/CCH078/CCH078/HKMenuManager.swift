//
//  HKMenuManager.swift
//  CCH078
//
//  Created by Lawrence Tan on 10/2/17.
//  Copyright © 2017 Lawrey. All rights reserved.
//

import Foundation

final class HKMenuManager {
    
    var currentMenuItem: SideMenuItem = .Home
    
    class func sharedInstance() -> HKMenuManager {
        
        struct Singleton {
            static var instance = HKMenuManager()
        }
        
        return Singleton.instance
        
    }
    
}
