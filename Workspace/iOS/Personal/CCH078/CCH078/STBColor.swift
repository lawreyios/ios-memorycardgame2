//
//  STBColor.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 2/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(byteRed red: Int, green: Int, blue: Int, alpha: Float = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    }
    
    static var stbGrayText: UIColor  { get { return UIColor(byteRed: 100, green: 97, blue: 102) } }
    static var stbBgGrayOne: UIColor  { get { return UIColor(byteRed: 248, green: 248, blue: 248) } }
    static var stbBgGrayTwo: UIColor  { get { return UIColor(byteRed: 244, green: 243, blue: 243) } }
    static var stbBgGrayThree: UIColor  { get { return UIColor(byteRed: 233, green: 233, blue: 233) } }
    
    static var stbBlueText: UIColor  { get { return UIColor(byteRed: 0, green: 114, blue: 187) } }
    static var stbPolylineBlue: UIColor  { get { return UIColor(byteRed: 30, green: 131, blue: 222) } }
}
