//
//  Environment.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Foundation

enum Environment {
    
    /// debug tag for debug, prod debug, preProd debug, sit debug, dev debug
    case debug
    /// RELEASE -> release
    case release
    /// unknown scheme
    case unknown
    
    /// The current selected environment
    ///
    /// - Author: Abdullah Alhaider
    static var current: Environment {
        #if DEBUG
        return .debug
        #elseif PROD
        return .prod
        #else
        return .unknown
        #endif
    }
    
    /// Bool value to determine if the current environment is debug || prod debug || preProd debug || sit debug || dev debug
    ///
    /// - Author: Abdullah Alhaider
    static var isDebug: Bool {
        return current == .debug
    }
}
