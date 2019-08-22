//
//  FontType.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

enum FontType {
    /// Font.bold.name.withSize(20)
    case h1
    /// Font.bold.name.withSize(18)
    case h2
    /// Font.bold.name.withSize(17)
    case h3
    case h4
    case h5
    case h6
    case custom(weight: Font, size: CGFloat)
    
    var font: UIFont {
        switch self {
        case .h1:
            return Font.bold.name.withSize(20)
        case .h2:
            return Font.bold.name.withSize(18)
        case .h3:
            return Font.bold.name.withSize(17)
        case .h4:
            return Font.regular.name.withSize(17)
        case .h5:
            return Font.regular.name.withSize(16)
        case .h6:
            return Font.regular.name.withSize(15)
        case .custom(let weight, let size):
            return weight.name.withSize(size)
        }
    }
}
