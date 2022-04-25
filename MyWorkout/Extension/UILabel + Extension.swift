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
    
    convenience init(text: String = "", font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
   }
}
