//
//  UIColor+Extensions.swift
//  Event
//
//  Created by claudiocarvalho on 14/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    // MARK: - Primary Colors
    
    static let eventPurpleDark = UIColor.rgb(red: 26, green: 26, blue: 68)
    static let eventPurple = UIColor.rgb(red: 103, green: 81, blue: 159)
    static let eventYellow = UIColor.rgb(red: 235, green: 199, blue: 51)
    
    // MARK: - Secondary Colors
    
    static let eventGrayDark = UIColor.rgb(red: 142, green: 142, blue: 147)
    static let eventGray = UIColor.rgb(red: 204, green: 204, blue: 204)
    static let eventGrayLight = UIColor.rgb(red: 247, green: 246, blue: 249)
}
