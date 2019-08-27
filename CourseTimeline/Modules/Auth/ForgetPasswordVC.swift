//
//  ForgetPasswordVC.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 26/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

class ForgetPasswordVC: BaseViewController {

    @IBOutlet weak var forgetPasswordView: View!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var titleLable: Label!
    @IBOutlet weak var sendButton: LoaderButton!
    @IBOutlet weak var hideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    override func setupUI() {
        backgroundColor = UIColor.View.clear
        titleLable.textColor = UIColor.Text.dark
        titleLable.font = Identity.font(.custom(weight: .regular, size: 18))
        forgetPasswordView.roundCorners(corners: [.topLeft, .topRight], radius: 15)
        hideButton.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    @IBAction func sendTapped(_ sender: LoaderButton) {
    }
    @IBAction func hideTapped(_ sender: UIButton) {
        dismissThis()
    }
}
