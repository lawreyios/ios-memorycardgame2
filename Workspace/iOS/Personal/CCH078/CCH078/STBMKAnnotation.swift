//
//  STBMKAnnotation.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 3/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit
import MapKit

class POIPointAnnotation: MKPointAnnotation {
    
    var pinImage: String!
    var index: Int!
    var isSelected: Bool!
    
    convenience init(index: Int, isSelected: Bool) {
        self.init()
        self.index = index
        self.isSelected = isSelected
        updateImage()
    }
    
    func updateImage() {
        if self.isSelected == true {
            self.pinImage = "pinSightseeMuseumSelect"
        }else{
            self.pinImage = "pinSightseeMuseum"
        }
    }
    
}
