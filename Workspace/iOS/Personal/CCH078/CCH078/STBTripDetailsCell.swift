//
//  STBTripDetailsCell.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 6/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

class STBTripDetailsCell: STBRootTableViewCell {
    
    @IBOutlet weak var detailsLabel: UILabel!

    override func configureCellData(data: Any) {
        guard let kid = data as? CCH078Kid else {
            return
        }
        titleLabel.text = kid.name
        subTitleLabel.text = kid.dob
        detailsLabel.text = "Age: \(kid.age)/\(kid.study) • Service: \(kid.getService())"
    }

}
