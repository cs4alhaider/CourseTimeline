//
//  Keys+NotificationCenter.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Foundation
import Helper4Swift

extension Keys {
    
    struct NotificationCenter {
        
        /// Notify about the user when he log in
        static let userLoggedIn = "Keys.NotificationCenter.userLoggedIn".asNotificationName
    }
}
