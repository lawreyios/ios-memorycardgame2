//
//  CCH078House.swift
//  CCH078
//
//  Created by Lawrence Tan on 8/2/17.
//  Copyright © 2017 Lawrey. All rights reserved.
//

import Foundation

enum ServiceType: Int {
    
    case SmallSun = 0
    case SmallSat = 1
    case BigFri = 2
    case BigSat11 = 3
    case BigSat1 = 4
    case None
}

struct CCH078House {
    
    var address: String
    var mumContact: String
    var dadContact: String
    var otherContact: String?
    
    var latitude: Double
    var longitude: Double
    
    var kids = [CCH078Kid]()
    
    func getKidsNames() -> String {
        var name = ""
        for kid in kids {
            name += "\(kid.name), "
        }
        return name
    }
    
}

struct CCH078Kid {
    
    var name: String
    var dob: String
    var age: String
    var study: String
    var serviceType: ServiceType
    var dobMonth: Int
    
    func getService() -> String {
        switch serviceType {
        case .SmallSun:
            return "Small Service (Sun)"
        case .SmallSat:
            return "Small Service (Sat)"
        case .BigFri:
            return "Big Service (Fri)"
        case .BigSat11:
            return "Big Service (Sat11)"
        case .BigSat1:
            return "Big Service (Sat1)"
        default:
            return "NA"
        }

    }
    
    func getDOBDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = Locale(identifier: "en-US") as Locale!
        let date = dateFormatter.date(from: dob)
        return date
    }
    
}
