//
//  STBImageViews.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 1/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

class STBRoundedImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
    
}
