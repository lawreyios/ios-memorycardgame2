//
//  STBBarButtons.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 3/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import Foundation
import UIKit

class STBRoundedButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = frame.size.height / 2
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 3
    }
}

class STBRoundedBlueButton: STBRoundedButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.stbBlueText
    }
    
}

class STBButtonImageRight: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        imageView?.transform = CGAffineTransform(scaleX: -10.0, y: 1.0)
    }
    
}

class STBCircularButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = frame.size.height / 2
        layer.borderColor = UIColor.stbBlueText.cgColor
        layer.borderWidth = 2.5
    }
    
}
