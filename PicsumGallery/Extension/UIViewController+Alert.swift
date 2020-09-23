//
//  UIViewController+Alert.swift
//  Picsum
//
//  Created by Parvez Qureshi on 16/09/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
//Show a basic alert
func showAlert(alertText : String, alertMessage : String) {
    let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    //Add more actions as you see fit
    self.present(alert, animated: true, completion: nil)
    }
}
