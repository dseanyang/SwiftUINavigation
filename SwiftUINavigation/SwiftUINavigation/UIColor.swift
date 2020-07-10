//
//  UIColor.swift
//  lilith
//
//  Created by Tz-Huan Huang on 2020/5/23.
//  Copyright © 2020 Potentia Computing Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: UInt8, green: UInt8, blue: UInt8) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }

    convenience init(red: UInt8, green: UInt8, blue: UInt8, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

    convenience init(hex: Int) {
        self.init(red: UInt8((hex >> 16) & 0xff), green: UInt8((hex >> 8) & 0xff), blue: UInt8(hex & 0xff), alpha: 1.0)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        self.init(red: UInt8((hex >> 16) & 0xff), green: UInt8((hex >> 8) & 0xff), blue: UInt8(hex & 0xff), alpha: alpha)
    }
    
    convenience init(hex: Int, alpha: UInt8) {
        self.init(red: UInt8((hex >> 16) & 0xff), green: UInt8((hex >> 8) & 0xff), blue: UInt8(hex & 0xff), alpha: alpha)
    }
}
