//
//  Fonts.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

enum Font {
    
    case black
    case bold
    case semibold
    case medium
    case regular
    case light
    case ultraLight
    case thin
    
    var name: UIFont {
        switch self {
        case .black:
            return UIFont.systemFont(ofSize: 10, weight: .black)
        case .bold:
            return UIFont.systemFont(ofSize: 10, weight: .bold)
        // return UIFont(name: "SomeFont-Bold", size: 10) ?? UIFont.boldSystemFont(ofSize: 10)
        case .semibold:
            return UIFont.systemFont(ofSize: 10, weight: .semibold)
        case .medium:
            return UIFont.systemFont(ofSize: 10, weight: .medium)
        case .regular:
            return UIFont.systemFont(ofSize: 10, weight: .regular)
        case .light:
            return UIFont.systemFont(ofSize: 10, weight: .light)
        case .ultraLight:
            return UIFont.systemFont(ofSize: 10, weight: .ultraLight)
        case .thin:
            return UIFont.systemFont(ofSize: 10, weight: .thin)
        }
    }
}
