//
//  UILabel + Extension.swift
//  MyWorkout
//
//  Created by Test on 23/04/22.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.font = .robotoMedim14()
        self.textColor = .specialLigtBrown
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
