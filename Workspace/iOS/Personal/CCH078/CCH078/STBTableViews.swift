//
//  STBTableViews.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 2/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import Foundation
import UIKit

class STBBasicTableView: UITableView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tableFooterView = UIView(frame: .zero)
        separatorStyle = .none
        estimatedRowHeight = 44
        rowHeight = UITableViewAutomaticDimension
    }
    
    func reloadSection(section: Int, animation: UITableViewRowAnimation) {
        super.reloadSections(IndexSet(integer: section), with: animation)
    }
    
    
}
