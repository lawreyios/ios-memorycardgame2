//
//  STBSideMenuSubViewController.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 2/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

enum SideMenuItem: Int {
    
    case Home = 0
    case Birthdays = 1
    
}

struct MenuItemModel {
    
    var menuItem: SideMenuItem?
    var title: String?
    var data: [String: AnyObject]?
    
}

class STBSideMenuSubViewController: UIViewController {
    
    let titles = ["Home", "Birthdays"]
    
    @IBOutlet weak var tableView: STBBasicTableView!

}

extension STBSideMenuSubViewController: UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 5000
    }
    
}

extension STBSideMenuSubViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "STBImageTitleCell", for: indexPath) as! STBImageTitleCell
        
        cell.configureCellData(data: [TITLE_KEY: titles[indexPath.row]])
        
        cell.configureCellBlueTheme()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismiss(animated: true, completion: nil)
        
        let selectedMenuItem = SideMenuItem(rawValue: indexPath.row)
        
        if selectedMenuItem != menuManager.currentMenuItem {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MenuItemTappedNotf"), object: nil, userInfo: ["data": MenuItemModel(menuItem: selectedMenuItem, title: titles[indexPath.row].capitalized, data: nil)])
        }
    }
}
