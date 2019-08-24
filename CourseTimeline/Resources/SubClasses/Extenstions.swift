//
//  Extenstions.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 24/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

extension UIView {
    /// Adding a new layer on the top for gradient colors
    func setBlueGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = UIColor.Gradient.primary
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
