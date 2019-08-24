//
//  UIStoryboard+Extension.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit
import Helper4Swift

extension UIStoryboard {
    
    static var main: UIStoryboard {
        return "Main".asStoryboard
    }
    
    static var auth: UIStoryboard {
        return "Auth".asStoryboard
    }
    
    static var home: UIStoryboard {
        return "Home".asStoryboard
    }
}
