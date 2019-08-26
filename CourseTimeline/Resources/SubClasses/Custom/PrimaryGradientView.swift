//
//  PrimaryGradientView.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

@IBDesignable class PrimaryGradientView: View {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setPrimaryGradientBackground()
    }
}

@IBDesignable class WhiteGradientView: View {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.View.white
        applyShadowWithRoundCorners(shadowColor: UIColor.Shadow.primary,
                                    cornerRadius: 12,
                                    shadowOpacity: 0.3,
                                    shadowRadius: 9)
    }
}
