//
//  STBTripCarouselViewController.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 3/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit
import MapKit

extension STBTripDetailsViewController: iCarouselDataSource, iCarouselDelegate {

    func numberOfItems(in carousel: iCarousel) -> Int {
        return kidsManager.houses.count
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var itemView: UIImageView
        
        itemView = UIImageView(frame: CGRect(x:0, y:0, width: 320, height: CAROUSEL_HEIGHT))
        itemView.image = UIImage(named: "kids")
        itemView.contentMode = .scaleAspectFill
        itemView.clipsToBounds = true
        
        return itemView
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        currentSelectedIndex = carousel.currentItemIndex
        hotspotTitleLabel!.text = kidsManager.houses[currentSelectedIndex].getKidsNames()
        updateMapViewWith(index: currentSelectedIndex)
        updateTableView()
    }
    
    fileprivate func updateTableView() {
        tableView.beginUpdates()
        tableView.reloadSection(section: TripSection.Title.rawValue, animation: .none)
        tableView.reloadSection(section: TripSection.Activities.rawValue, animation: .automatic)
        tableView.endUpdates()
    }
    
    fileprivate func updateMapViewWith(index: Int) {
        mapView?.removeAnnotations(annotations)
        for annotation in annotations {
            if annotation.index == index {
                annotation.isSelected = true
            }else{
                annotation.isSelected = false
            }
            annotation.updateImage()
        }
        mapView?.addAnnotations(annotations)
        mapView?.showAnnotations(annotations, animated: false)
    }
    
    
}
