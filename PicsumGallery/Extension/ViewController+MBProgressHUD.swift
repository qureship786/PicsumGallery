//
//  ViewController+MBProgressHUD.swift
//  Centauro
//
//  Created by Parvez Qureshi on 18/06/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation
import MBProgressHUD

extension UIViewController {
    func showIndicator() {
        let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.view.isUserInteractionEnabled = false
        indicator.show(animated: true)
        
    }
    func hideIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.view.isUserInteractionEnabled = true
    }
}
