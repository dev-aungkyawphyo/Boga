//
//  UIColor+Extensions.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 15/10/2024.
//

import Foundation
import UIKit

extension UIColor {
    
    static func appColor(_ name: AssetColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}
