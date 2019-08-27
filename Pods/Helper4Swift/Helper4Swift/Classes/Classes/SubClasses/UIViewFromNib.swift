//
//  UIViewFromNib.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 23/08/2019.
//

import UIKit

open class UIViewFromNib: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addSubviewFromNib()
        setupViews()
    }
    
    /// Add your custom code here, no need to call super.
    open func setupViews() { }
}
