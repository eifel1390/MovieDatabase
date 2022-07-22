//
//  UIViewExtensions.swift
//  MovieDatabase
//
//  Created by Maksim Turkin on 22.07.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 1)
    }

}
