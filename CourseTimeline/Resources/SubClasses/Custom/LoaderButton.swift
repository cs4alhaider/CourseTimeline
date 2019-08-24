//
//  LoaderButton.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Helper4Swift

@IBDesignable class LoaderButton: Button {
    
    var originalButtonText: String?
    private var activityIndicator: UIActivityIndicatorView!
    var indicatorColor = UIColor.View.primary
    
    enum ButtonsStatus {
        case active
        case deactive
        case startLoading
        case stopLoading
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    private func setup() {
        changeStatus(to: .active)
        self.titleLabel?.font = Identity.font(.custom(weight: .semibold, size: 17))
    }
    
    func changeStatus(to status: ButtonsStatus, duration: TimeInterval = 0.3) {
        switch status {
        case .active:
            set(backgroundColor: UIColor.View.primary, titleColor:  UIColor.Text.white, isEnabled: true, withIndicator: false, duration: duration)
        case .deactive:
            set(backgroundColor: UIColor.View.deActive, titleColor: UIColor.Text.deActive, isEnabled: false, withIndicator: false, duration: duration)
        case .startLoading:
            set(backgroundColor: UIColor.View.primary.withAlphaComponent(0.6), titleColor: UIColor.Text.clear, isEnabled: false, withIndicator: true, duration: duration)
        case .stopLoading:
            set(backgroundColor: UIColor.View.primary, titleColor:  UIColor.Text.white, isEnabled: true, withIndicator: false, duration: duration)
        }
        
    }
    
    func set(backgroundColor: UIColor, titleColor: UIColor, isEnabled: Bool, withIndicator: Bool, duration: TimeInterval = 0.4) {
        animate(.changeColor(to: backgroundColor, duration: duration))
        buttonAnimation(.changeTextColor(to: titleColor, duration: duration))
        self.isEnabled = isEnabled
        withIndicator ? startLoading() : stopLoading()
    }
    
    private func startLoading() {
        H4S.feedbackGenerator(type: .light)
        originalButtonText = titleLabel?.text
        setTitle("", for: .normal)
        if activityIndicator == nil {
            activityIndicator = createActivityIndicator()
        }
        showSpinning()
    }
    
    private func stopLoading() {
        if activityIndicator != nil {
            DispatchQueue.main.async {
                self.setTitle(self.originalButtonText, for: .normal)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = indicatorColor
        return activityIndicator
    }
    
    private func showSpinning() {
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
        isEnabled = false
    }
    
    private func centerActivityIndicatorInButton() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let xCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(yCenterConstraint)
    }
    
}

class LightLoaderButton: LoaderButton {
    override func changeStatus(to status: LoaderButton.ButtonsStatus, duration: TimeInterval = 0.3) {
        switch status {
        case .active:
            set(backgroundColor: UIColor.View.lightPrimary, titleColor:  UIColor.Text.primary, isEnabled: true, withIndicator: false, duration: duration)
        case .deactive:
            set(backgroundColor: UIColor.View.deActive, titleColor: UIColor.Text.deActive, isEnabled: false, withIndicator: false, duration: duration)
        case .startLoading:
            set(backgroundColor: UIColor.View.primary.withAlphaComponent(0.3), titleColor: UIColor.Text.clear, isEnabled: false, withIndicator: true, duration: duration)
        case .stopLoading:
            set(backgroundColor: UIColor.View.lightPrimary, titleColor:  UIColor.Text.primary, isEnabled: true, withIndicator: false, duration: duration)
        }
    }
}
