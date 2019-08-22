//
//  Fonts.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

enum Font {
    
    case bold
    case regular
    case light
    case black
    
    var name: UIFont {
        switch self {
        case .bold:
            return UIFont.boldSystemFont(ofSize: 10)
        // return UIFont(name: "Mobily-Bold", size: 10) ?? UIFont.boldSystemFont(ofSize: 10)
        case .black:
            return UIFont.boldSystemFont(ofSize: 10)
        // return UIFont(name: "Mobily-Black", size: 10) ?? UIFont.boldSystemFont(ofSize: 10)
        case .regular:
            return UIFont.systemFont(ofSize: 10)
        // return UIFont(name: "Mobily-Regular", size: 10) ?? UIFont.systemFont(ofSize: 10)
        case .light:
            return UIFont.systemFont(ofSize: 10)
            // return UIFont(name: "Mobily-Light", size: 10) ?? UIFont.systemFont(ofSize: 10)
        }
    }
}
