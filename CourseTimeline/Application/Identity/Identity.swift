//
//  Identity.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

struct Identity {
    
    /// Used for buttons, textFields 
    static let boxRadius: CGFloat = 8
    
    static func font(_ type: FontType) -> UIFont {
        return type.font
    }
    
    // static func color(_ type: ColorType) -> UIColor {
    //     return type.color
    // }
    
}

extension UIView {
    
    /// Adding a new layer on the top for gradient colors
    func setPrimaryGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = UIColor.Gradient.primary
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

