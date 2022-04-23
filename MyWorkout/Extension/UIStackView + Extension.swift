//
//  UIStackView + Extension.swift
//  MyWorkout
//
//  Created by Test on 22/04/22.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubview: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubview)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
