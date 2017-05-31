//
//  STBPOIViewController.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 7/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

private enum POISection: Int {
    
    case Title = 0
    case Image = 1
    case ShowMore = 2
    case Map = 3
    case Hashtag = 4
    case Reviews = 5
    case Attractions = 6
    
    static var count: Int { return POISection.Attractions.hashValue + 1 }
}

class STBPOIViewController: STBRootViewController, UITableViewDataSource, UITableViewDelegate, STBRootCellDelegate {

    @IBOutlet weak var tableView: STBBasicTableView!

    var selectedPOIIndex:Int = 0
    
    var selectedHouse: CCH078House?
    
    var shouldShowMore: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return POISection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionValue: POISection = POISection(rawValue: section)!
        switch sectionValue {
        case .Attractions, .Reviews:
            return 3
        case .Hashtag:
            return 0
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionValue: POISection = POISection(rawValue: indexPath.section)!
        switch sectionValue {
        case .Title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "STBPOITitleCell", for: indexPath) as! STBRootTableViewCell
            cell.subTitleLabel.text = ""
            return cell
        case .Image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "STBPOIImageCell", for: indexPath)
            return cell
        case .Map:
            let cell = tableView.dequeueReusableCell(withIdentifier: "STBPOIMapCell", for: indexPath) as! STBPOIMapCell
            cell.configureCellData(data: selectedHouse!)
            return cell
        case .Attractions:
            let cell = tableView.dequeueReusableCell(withIdentifier: "STBPOIDetailsCell", for: indexPath) as! STBTripDetailsCell
            return cell
        default:
            return STBRootTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionValue: POISection = POISection(rawValue: section)!
        let sectionHeaderView = UIView.loadFromNibNamed(nibNamed: "STBPOISectionHeaderView") as! STBPOISectionHeaderView
        switch sectionValue {
        case .Map:
            sectionHeaderView.titleLabel.text = "transport time & fare"
            return sectionHeaderView
        case .Hashtag:
            sectionHeaderView.titleLabel.text = "#padang on Instagram"
            return sectionHeaderView
        case .Reviews:
            sectionHeaderView.titleLabel.text = "12 reviews"
            return sectionHeaderView
        case .Attractions:
            sectionHeaderView.titleLabel.text = "nearby attractions"
            return sectionHeaderView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionValue: POISection = POISection(rawValue: section)!
        switch sectionValue {
        case .Map, .Hashtag, .Reviews, .Attractions:
            return 44
        default:
            return 0
        }
    }
    
    func cellDidTapButtonWith(data: Any?, index: Int) {
        
        let buttonClicked: ButtonClicked = ButtonClicked(rawValue: index)!
        
        switch buttonClicked {
        default:
            break
        }
        
    }
    
    func configureCellData(data: Any) { }
    
    private func onShowMore() {
        shouldShowMore = !shouldShowMore
        tableView.beginUpdates()
        tableView.reloadSection(section: POISection.ShowMore.rawValue, animation: .automatic)
        tableView.endUpdates()
    }
    
}
