//
//  STBUILabels.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 2/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

class STBLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)))
    }
}

class STBRoundedLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = frame.size.height / 2
    }
    
}
