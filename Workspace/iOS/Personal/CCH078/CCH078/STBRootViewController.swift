//
//  STBRootViewController.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 3/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

protocol STBRootViewDelegate {
    
    func initView()
    
}

class STBRootViewController: UIViewController, STBRootViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func initView() {
        //setStatusBarTransparent()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "MenuItemTappedNotf"), object: nil, queue: nil, using: onMenuItemTapped)
    }
    
    func setStatusBarTransparent() {
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.isTranslucent = true
    }
    
    @IBAction func onClose(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func didSelectMenuItemWith(index: Int) {
        let sideMenuValue: SideMenuItem = SideMenuItem(rawValue: index)!
        switch sideMenuValue {
        case .Home:
            let vc = UIStoryboard.loadTripDetailsController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .Birthdays:
            let vc = UIStoryboard.loadBirthdaysController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: Notifications
    
    func onMenuItemTapped(notification: Notification) -> Void {
        if let userInfo = notification.userInfo {
            if let menuItem = userInfo["data"] as? MenuItemModel {
                pushViewWithMenuItem(menuItem: menuItem)
            }
        }
    }
    
    // MARK: Other Actions
    
    private func pushViewWithMenuItem(menuItem: MenuItemModel) {
        let menu = menuItem.menuItem! as SideMenuItem
        switch menu   {
        case .Home:
            let vc = UIStoryboard.loadTripDetailsController()
            vc.title = menuItem.title
            navigationControllerPush(viewController: vc)
            break
        case .Birthdays:
            let vc = UIStoryboard.loadBirthdaysController()
            vc.title = menuItem.title
            navigationControllerPush(viewController: vc)
            break
        }
    }
    
    private func navigationControllerPush(viewController: UIViewController) {
            self.navigationController?.pushViewController(viewController, animated: true)
    }
}
