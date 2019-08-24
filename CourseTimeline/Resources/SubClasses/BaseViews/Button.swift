//
//  Button.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit
import Helper4Swift

@IBDesignable class Button: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        corners()
    }
    
    // This method is called during programmatic initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        corners()
    }
    
    // required method to present changes in IB
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupViews()
        corners()
    }
    
    func setupViews() {
        backgroundColor = UIColor.View.primary
        setTitleColor(UIColor.Text.white, for: .normal)
    }
    
    func corners() {
        layer.cornerRadius = min(frame.height, frame.width) / 2 // to get half a circle
        // layer.cornerRadius = 4
    }
    
}
