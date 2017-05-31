//
//  STBUIViews.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 2/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import Foundation
import UIKit

class TableHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(text: String, frame: CGRect) {
        self.init(frame: frame)
        backgroundColor = UIColor.clear
        addLabelWithText(text: text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addLabelWithText(text: String) {
        let label = STBLabel(frame: self.frame)
        label.text = text
        label.textColor = UIColor.gray
        addSubview(label)
    }
    
}

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}
