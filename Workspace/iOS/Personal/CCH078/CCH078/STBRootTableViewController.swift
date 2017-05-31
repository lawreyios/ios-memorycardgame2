//
//  STBRootTableViewController.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 1/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

class STBRootTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return super.numberOfSections(in: tableView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    

}
