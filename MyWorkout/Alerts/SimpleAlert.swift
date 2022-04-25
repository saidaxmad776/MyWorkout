//
//  SimpleAlert.swift
//  MyWorkout
//
//  Created by Test on 25/04/22.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
}
