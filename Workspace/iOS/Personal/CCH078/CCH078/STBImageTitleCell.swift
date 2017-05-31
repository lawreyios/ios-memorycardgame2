//
//  STBPreferenceCell.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 1/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

let TITLE_KEY = "title"
let SUBTITLE_KEY = "subtitle"
let IMAGE_KEY = "image"

class STBImageTitleCell: STBRootTableViewCell {

    @IBOutlet weak var accessoryImageView: UIImageView!
    
    @IBOutlet weak var selectionViewBar: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)        
    }
    
    func configureCellGrayTheme() {
        
        backgroundColor = UIColor.stbBgGrayOne
        titleLabel.textColor = UIColor.stbGrayText
        titleLabel.font = UIFont(name: FontName.MuseoSans300.rawValue, size: StandardSize.h4.rawValue)
        accessoryImageView.isHidden = false
        
    }
    
    func configureCellBlueTheme() {
        
        titleLabel.textColor = UIColor.stbBlueText
        titleLabel.font = UIFont(name: FontName.MuseoSans300.rawValue, size: StandardSize.h1.rawValue)
        accessoryImageView.isHidden = true
        
    }
    
    override func configureCellData(data: Any) {
        guard let data = data as? [String: Any] else {
            return
        }
        
        guard let title = data[TITLE_KEY] as? String else {
            return
        }
        
        titleLabel.text = title
        
        selectionViewBar.isHidden = !(title == "Home")
    }
    
}
