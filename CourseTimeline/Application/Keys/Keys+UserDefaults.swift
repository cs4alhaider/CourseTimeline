//
//  Keys+UserDefaults.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Foundation

extension Keys {
    
    struct UserDefaults {
        
        /// To save the bool if user is loged in
        static let isLoggedIn = "Keys.UserDefaults.isLoggedIn"
        
        static let userEmail = "Keys.UserDefaults.userEmail"
        
        static let userUID = "Keys.UserDefaults.userUID"
    }
}
