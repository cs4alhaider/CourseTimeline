//
//  Colors.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

// typealias ViewColors = UIColor.View
// typealias TextColors = UIColor.Text
// typealias ShadowColros = UIColor.Shadow

extension UIColor {
    
    private static var primaryColor: UIColor {
        return #colorLiteral(red: 0.1486437619, green: 0.5167973042, blue: 0.9228035808, alpha: 1)
        // return #colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.01568627451, alpha: 1)
    }
    
    // MARK:- View colors
    /// Views only colors
    struct View {
        
        /// App primary color
        static var primary: UIColor {
            return UIColor.primaryColor
        }
        
        /// App primary color
        static var lightPrimary: UIColor {
            return #colorLiteral(red: 0.7566730976, green: 0.8881542087, blue: 0.9864361882, alpha: 1)
            // return #colorLiteral(red: 0.9960784314, green: 0.8235294118, blue: 0.5921568627, alpha: 1)
        }
        
        /// Main color for all views
        static var background: UIColor {
            return #colorLiteral(red: 0.9450980392, green: 0.9803921569, blue: 1, alpha: 1)
        }
        
        /// White color
        static var white: UIColor {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        /// Light color
        static var light: UIColor {
            return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
        
        static var deActive: UIColor {
            return #colorLiteral(red: 0.9026200998, green: 0.9115569325, blue: 0.9115569325, alpha: 1)
        }
        
        static var clear: UIColor {
            return .clear
        }
    }
    
    // MARK:- Text Colors
    struct Text {
        
        static var primary: UIColor {
            return UIColor.primaryColor
        }
        
        static var dark: UIColor {
            return #colorLiteral(red: 0.2674786747, green: 0.2625952065, blue: 0.2626324892, alpha: 1)
        }
        
        static var light: UIColor {
            return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
        
        static var white: UIColor {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        static var deActive: UIColor {
            return #colorLiteral(red: 0.653067769, green: 0.653067769, blue: 0.653067769, alpha: 1)
        }
        
        static var clear: UIColor {
            return .clear
        }
    }
    
    // MARK:- Shadow Colors
    struct Shadow {
        
        static var primary: UIColor {
            return UIColor.primaryColor
        }
        
        static var dark: UIColor {
            return #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        }
        
        static var light: UIColor {
            return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
        
        static var clear: UIColor {
            return .clear
        }
    }
    
    struct Gradient {
        
        static var primary: [CGColor] {
            return [UIColor.primaryColor.withAlphaComponent(0.9).cgColor,
                    UIColor.primaryColor.cgColor]
        }
    }
    
}
