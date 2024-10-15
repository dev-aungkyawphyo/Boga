//
//  BogaButton.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 15/10/2024.
//

import Foundation
import UIKit

@IBDesignable
class BogaButton: UIButton {
    
    @IBInspectable
    var cornerRadiuc: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        self.setTitleColor(.appColor(.btnTextColor), for: .normal)
        self.backgroundColor = .appColor(.primaryColor)
        self.layer.cornerRadius = 22
    }
    
}
