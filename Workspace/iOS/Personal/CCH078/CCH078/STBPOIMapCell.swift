//
//  STBPOIMapCell.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 7/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit
import MapKit

let ZOOM_LEVEL_LAT:CLLocationDistance = 500
let ZOOM_LEVEL_LNG:CLLocationDistance = 500

class STBPOIMapCell: STBRootTableViewCell, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var driveTimeLabel: UILabel!
    @IBOutlet weak var drivePriceButton: STBRoundedBlueButton!
    
    @IBOutlet weak var publicTimeLabel: UILabel!
    @IBOutlet weak var publicPriceButton: STBRoundedBlueButton!

    @IBOutlet weak var walkTimeLabel: UILabel!
    
    @IBOutlet weak var locationLabel: STBRoundedLabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func configureCellData(data: Any) {
        guard let house = data as? CCH078House else {
            return
        }
        
        setupMapViewWith(selectedHouse: house)
    }
    
    private func setupMapViewWith(selectedHouse: CCH078House) {
        
        mapView.delegate = self
        
        let currLocationCoordinate = CLLocationCoordinate2D(latitude: selectedHouse.latitude, longitude: selectedHouse.longitude)
        
        let currAnnotation = POIPointAnnotation(index: 0, isSelected: true)
        
        currAnnotation.coordinate = currLocationCoordinate
        
        if mapView.annotations.count > 0 { mapView.removeAnnotation(currAnnotation) }
        
        mapView.addAnnotation(currAnnotation)
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(currLocationCoordinate, ZOOM_LEVEL_LAT, ZOOM_LEVEL_LNG)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "poiPin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! POIPointAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinImage)
        annotationView?.tag = customPointAnnotation.index
        
        return annotationView
    }
    
}
