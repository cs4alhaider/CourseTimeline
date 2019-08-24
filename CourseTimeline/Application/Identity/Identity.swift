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
