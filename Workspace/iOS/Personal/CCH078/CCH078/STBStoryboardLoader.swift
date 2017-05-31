//
//  STBStoryboardLoader.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 1/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

fileprivate enum Storyboard : String {
    
    case Main = "Main"
    case Trips = "Trips"
}

fileprivate extension UIStoryboard {
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .Main, identifier: identifier)
    }

    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: App View Controllers

extension UIStoryboard {
    
    //SideMenu
    class func loadSideMenuController() -> STBSideMenuSubViewController {
        return loadFromMain("STBSideMenuSubViewController") as! STBSideMenuSubViewController
    }
    
    //Birthdays
    class func loadBirthdaysController() -> HKBirthdaysViewController {
        return loadFromMain("HKBirthdaysViewController") as! HKBirthdaysViewController
    }
    
    //Trip Details
    class func loadTripDetailsController() -> STBTripDetailsViewController {
        return loadFromMain("STBTripDetailsViewController") as! STBTripDetailsViewController
    }
    
    class func loadPOIController() -> STBPOIViewController {
        return loadFromMain("STBPOIViewController") as! STBPOIViewController
    }
    
}
