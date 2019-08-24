//
//  TextField.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

@IBDesignable class TextField: UITextField {

    @IBInspectable var image: UIImage? {
        didSet {
            setImage()
        }
    }
    
    private lazy var sideImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    // MARK: - Properties.
    private var shadowLayer: CAShapeLayer!
    
    private let shadoColor: UIColor = .black
    private lazy var baseCornerRadius = Identity.boxRadius // min(self.frame.height, self.frame.width) / 2
    
    @IBInspectable var baseBorderWidth: CGFloat = 0.7 {
        didSet {
            refreshBorderWidth(value: baseBorderWidth)
        }
    }
    
    // MARK: - Enums.
    
    /// Border status for the text field.
    ///
    /// - normal: gray.
    /// - focused: blue.
    /// - error: red.
    enum BorderStatus {
        case normal
        case focused
        case error
        
        var color: UIColor {
            switch self {
            case .normal:
                return .lightGray
            case .focused:
                return UIColor.View.primary
            case .error:
                return .red
            }
        }
    }
    
    // MARK: - init methods
    
    /// Initializing this class for programmatic use.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    /// Initializing this class for interface builder (Storyboard) use.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    /// Calling the this method to compile for the interface builder (Storyboard).
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupViews()
    }
    
    // MARK: - private methods.
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = shadoColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize.zero
            shadowLayer.shadowOpacity = 0.3
            shadowLayer.shadowRadius = 5
            layer.insertSublayer(shadowLayer, at: 0)
            // layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }
    
    /// Main method to be executed.
    private func setupViews() {
        set(to: .lightGray)
        addSideImage()
    }
    
    /// Updating the proprties.
    ///
    /// - Parameter color: Identity.color(.MWhite).
    private func set(to color: UIColor) {
        
        // Basic texfield Setup
        borderStyle = .none
        backgroundColor = .clear
        textColor = .darkGray
        // clipsToBounds = true
        
        // To apply corner radius
        layer.cornerRadius = baseCornerRadius
        
        // To apply border
        layer.borderWidth = baseBorderWidth
        layer.borderColor = color.cgColor
    }
    
    private func addSideImage() {
        addSubview(sideImage)
        // if Language.isArabic {
            sideImage.anchor(top: topAnchor,
                             left: leftAnchor,
                             bottom: bottomAnchor,
                             right: nil,
                             topConstant: 5,
                             leftConstant: 15,
                             bottomConstant: 5,
                             rightConstant: 0)
        // } else {
            sideImage.anchor(top: topAnchor,
                             left: nil,
                             bottom: bottomAnchor,
                             right: rightAnchor,
                             topConstant: 5,
                             leftConstant: 0,
                             bottomConstant: 5,
                             rightConstant: 15)
        // }
    }
    
    /// Refreshing the corners radius.
    ///
    /// - Parameter value: the value to set to the cornerRadius.
    private func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    /// Refreshing the border width
    ///
    /// - Parameter value: the value to set to the borderWidth.
    private func refreshBorderWidth(value: CGFloat) {
        layer.borderWidth = value
    }
    
    private func setImage() {
        guard let image = self.image else { sideImage.display = .hidden; return }
        sideImage.display = .visible
        sideImage.image = image
    }
    
    // MARK: - public methods
    
    /// Changing the status of the textField from the view controller.
    ///
    /// like:
    ///
    /// @IBAction func buttonTapped(_ sender: UIButton) {
    ///     textField.changeStatus(to: .normal) // HERE
    /// }
    ///
    /// - Parameter status: normal,focused, error.
    public func changeStatus(to status: BorderStatus) {
        // nothing
    }
    
    // MARK: - Handling and adding the left and right padding
    
    /// Handeling the rightView and leftView on the textfield
    ///
    /// - Parameter clearButtonMode: .unlessEditing, .whileEditing, ...
    /// - Returns: UIEdgeInsets
    private func getPadding(plusExtraFor clearButtonMode: ViewMode) -> UIEdgeInsets {
        var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        // Add additional padding on the right side when showing the clear button
        if self.clearButtonMode == .always || self.clearButtonMode == clearButtonMode {
            padding.right = 35
        }
        return padding
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding(plusExtraFor: .unlessEditing)
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding(plusExtraFor: .unlessEditing)
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding(plusExtraFor: .whileEditing)
        return bounds.inset(by: padding)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let orginalRect = super.clearButtonRect(forBounds: bounds)
        return orginalRect.offsetBy(dx: -10, dy: 0)
        // return Language.isArabic ? orginalRect.offsetBy(dx: 10, dy: 0) : orginalRect.offsetBy(dx: -10, dy: 0)
    }
}
