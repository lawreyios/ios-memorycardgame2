//
//  CCH078BirthdaysViewController.swift
//  CCH078
//
//  Created by Lawrence Tan on 10/2/17.
//  Copyright © 2017 Lawrey. All rights reserved.
//

import UIKit

class HKBirthdaysViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: STBBasicTableView!
    
    var kids = [CCH078Kid]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initData()
    }
    
    private func initData() {
        for key in kidsManager.birthdays.keys {
            let array = kidsManager.birthdays[key]
            print(array)
        }
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kidsManager.kids.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HKBirthdayCell", for: indexPath) as! STBRootTableViewCell
        let currentKid = kidsManager.kids[indexPath.row]
        cell.configureCellData(data: [TITLE_KEY: currentKid.name, SUBTITLE_KEY: currentKid.dob])
        return cell
    }
}
