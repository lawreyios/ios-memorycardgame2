//
//  STBTripActivitiesViewController.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 2/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

extension STBTripDetailsViewController: UITableViewDelegate, UITableViewDataSource, STBRootCellDelegate, UIGestureRecognizerDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TripSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section: TripSection = TripSection(rawValue: section)!
        switch section {
        case .Main, .Title:
            return 1
        case .Activities:
            let currentHouse = kidsManager.houses[currentSelectedIndex]
            return currentHouse.kids.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section: TripSection = TripSection(rawValue: indexPath.section)!
        switch section {
        case .Main:
            let cell = tableView.dequeueReusableCell(withIdentifier: "STBTripMainCell", for: indexPath) as! STBTripMainCell
            cell.commonInitWith(houses: kidsManager.houses)
            cell.delegate = self            
            mapView = cell.mapView
            hotspotTitleLabel = cell.titleLabel
            annotations = cell.annotations
            return cell
        case .Title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "STBTripTitleCell", for: indexPath) as! STBTripTitleCell
            let currentHouse = kidsManager.houses[currentSelectedIndex]
            cell.delegate = self
            cell.configureCellData(data: ["title": currentHouse.getKidsNames(), "subTitle": currentHouse.address])
            return cell
        case .Activities:
            let cell = tableView.dequeueReusableCell(withIdentifier: "STBTripDetailsCell", for: indexPath) as! STBTripDetailsCell
            let currKid = kidsManager.houses[currentSelectedIndex].kids[indexPath.row]
            cell.configureCellData(data: currKid)
            return cell
        }
    }
    
    func configureCellData(data: Any) {
        
    }
    
    func cellDidTapButtonWith(data: Any?, index: Int) {
        
        let buttonClicked: ButtonClicked = ButtonClicked(rawValue: index)!
        
        switch buttonClicked {
        case .AddActivities:
            //call add activities
            break
        case .Whatsapp:
            onWhatsapp()
            break
        case .Close:
            onClose(self)
            break
        case .MapPin:
            onMapPinWith(data: data)
            break
        }
    }
    
    func onWhatsapp() {
//        let activityVC = UIActivityViewController(activityItems: ["Hello this week is .. ", UIImage(named: "kids")!], applicationActivities: [])
//        let excludeActivities = [UIActivityType.airDrop, UIActivityType.print, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToFacebook, UIActivityType.postToWeibo]
//        activityVC.excludedActivityTypes = excludeActivities
//        self.present(activityVC, animated: true, completion: { _ in })
        let text = "Hello! This week is Friendship Reunion! If a friend is accompanied, can get a box of love! Will they be taking the bus tomorrow? Do they need dinner in church? :)"
        if (UIApplication.shared.canOpenURL(URL(string: "whatsapp://")!)) {
            UIApplication.shared.open(URL(string: "whatsapp://send?text=\(text)")!, options: [:], completionHandler: nil)
        }
    }
    
    private func onMapPinWith(data: Any?) {
//        guard let data = data as? [String: Any] else {
//            return
//        }
//        
//        let vc = UIStoryboard.loadPOIController()
//        vc.selectedHouse = houses[currentSelectedIndex]
//        navigationController?.pushViewController(vc, animated: true)
        let currLoc = kidsManager.houses[currentSelectedIndex]
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps://?saddr=&daddr=\(currLoc.latitude),\(currLoc.longitude)&directionsmode=walking")! as URL)
            
        } else {
        }
    }
    
    
}
