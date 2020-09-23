//
//  UIButton+Extension.swift
//  Centauro
//
//  Created by Parvez Qureshi on 24/06/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import UIKit


extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
    
}
