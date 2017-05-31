//
//  STBTripMainCell.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 6/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit
import MapKit

class STBTripMainCell: STBRootTableViewCell, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageCarousel: iCarousel!
    
    var vcDelegate: Any?
    
    var annotations = [POIPointAnnotation]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)        
    }
    
    func commonInitWith(houses: [CCH078House]) {
        setupCarousel()
        setupMapViewWith(houses: houses)
    }
    
    private func setupCarousel() {
        imageCarousel.type = .linear
        imageCarousel.bounces = false
    }
    
    private func setupMapViewWith(houses: [CCH078House]) {
        
        mapView.delegate = self
        
        var index = 0
        
        for house in houses {
            
            let currLocationCoordinate = CLLocationCoordinate2D(latitude: house.latitude, longitude: house.longitude)
            
            let currAnnotation = POIPointAnnotation(index: index, isSelected: (index == 0))
            
            currAnnotation.title = house.getKidsNames()
            currAnnotation.coordinate = currLocationCoordinate
            
            annotations.append(currAnnotation)
            
            index += 1
        }
        
        // check for user location
        if let userLocAnnotation = STBLocationManager.sharedInstance().manager.location {
            let currAnnotation = POIPointAnnotation(index: index, isSelected: (index == 0))
            currAnnotation.coordinate = userLocAnnotation.coordinate
            //annotations.append(currAnnotation)
        }
        
        if mapView.annotations.count > 0 { mapView.removeAnnotations(annotations) }
        
        mapView.showAnnotations(annotations, animated: true )
        
        //addPolyLineToMap(locations: TripDetailsDummyData().locations)
        
    }
    
    func addPolyLineToMap(locations: [CLLocation?])
    {
        var coordinates = locations.map { (location) -> CLLocationCoordinate2D in
            return (location?.coordinate)!
        }
        
        let polyline = MKPolyline(coordinates: &coordinates, count: locations.count)
        self.mapView.add(polyline)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let pr = MKPolylineRenderer(overlay: overlay);
        pr.strokeColor = UIColor.stbPolylineBlue
        pr.lineWidth = 5;
        return pr;
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "poiPin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if (annotation is MKUserLocation) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "userPin")
            annotationView?.image = UIImage(named: "pinUser")
            return annotationView
        }        
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.canShowCallout = true
        annotationView?.isSelected = true
        
        let customPointAnnotation = annotation as! POIPointAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinImage)
        annotationView?.tag = customPointAnnotation.index
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onAnnotation(_:)))
        gestureRecognizer.delegate = delegate as! UIGestureRecognizerDelegate?
        annotationView?.addGestureRecognizer(gestureRecognizer)
        
        return annotationView
    }
    
    func onAnnotation(_ sender: UITapGestureRecognizer) {
        //imageCarousel.scrollToItem(at: (sender.view?.tag)!, animated: true)
        //delegate?.cellDidTapButtonWith(data: ["index": (sender.view?.tag)!], index: ButtonClicked.MapPin.rawValue)
    }
    
    override func configureCellData(data: Any) {
        guard let data = data as? [String: Any] else {
            return
        }
        guard let title = data["title"] as? String else {
            return
        }
        titleLabel.text = title
    }
    
    @IBAction func onAddActivities(_ sender: Any) {
        delegate?.cellDidTapButtonWith(data: nil, index: ButtonClicked.AddActivities.rawValue)
    }
    
    @IBAction func onClose(_ sender: Any) {
        delegate?.cellDidTapButtonWith(data: nil, index: ButtonClicked.Close.rawValue)
    }
    

}
