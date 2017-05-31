//
//  STBTripDetailsViewController.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 2/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit
import MapKit

let CAROUSEL_HEIGHT: CGFloat = 160
let OFFSET_HEIGHT: CGFloat = 22

enum TripSection: Int {
    
    case Main = 0
    case Title = 1
    case Activities = 2
    
    static var count: Int { return TripSection.Activities.hashValue + 1 }
}

enum ButtonClicked: Int {
    
    case AddActivities = 0
    case Close = 1
    case Whatsapp = 2
    case MapPin = 4
}

class STBTripDetailsViewController: STBRootViewController {

    @IBOutlet weak var tableView: STBBasicTableView!
    
    var shouldShowMore:Bool = false
    
    var hotspotTitleLabel: UILabel?
    
    var mapView: MKMapView?
    var annotations = [POIPointAnnotation]()
    var currentSelectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        STBLocationManager.sharedInstance().manager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        STBLocationManager.sharedInstance().manager.stopUpdatingLocation()
    }
    
    private func createData() {
 
        kidsManager.initKids()
       
    }
    

}
