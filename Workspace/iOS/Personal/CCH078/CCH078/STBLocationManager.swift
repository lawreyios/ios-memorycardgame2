//
//  STBLocationManager.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 7/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class STBLocationManager: NSObject, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let manager = CLLocationManager()
    var mapView: MKMapView?
    
    var annotations = [POIPointAnnotation]()
    
    class func sharedInstance() -> STBLocationManager {
        
        struct Singleton {
            static var instance = STBLocationManager()
        }
        
        return Singleton.instance
        
    }
    
    func initUserLocation(target: CLLocationManagerDelegate?) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            //print("Found user's location: \(location)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    
}
