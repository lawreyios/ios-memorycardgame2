//
//  STBTripTitleCell.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 6/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

class STBTripTitleCell: STBRootTableViewCell {
    
    override func configureCellData(data: Any) {
        guard let data = data as? [String: Any] else {
            return
        }
        guard let title = data["title"] as? String, let subTitle = data["subTitle"] as? String else {
            return
        }
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    @IBAction func onWhatsapp(_ sender: Any) {
        delegate?.cellDidTapButtonWith(data: nil, index: ButtonClicked.Whatsapp.rawValue)
    }
    
    @IBAction func onMap(_ sender: Any) {
        delegate?.cellDidTapButtonWith(data: nil, index: ButtonClicked.MapPin.rawValue)
    }

}
