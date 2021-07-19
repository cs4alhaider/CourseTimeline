//
//  ForgetPasswordVC.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 26/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

class ForgetPasswordVC: BaseViewController {

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var titleLable: Label!
    @IBOutlet weak var subTitleLable: Label!
    @IBOutlet weak var sendButton: LoaderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    override func setupUI() {
        titleLable.font = Identity.font(.custom(weight: .bold, size: 27))
        titleLable.textColor = UIColor.View.white
    }
    
    @IBAction func sendTapped(_ sender: LoaderButton) {
        guard let email = emailTextField.text?.trimmed, email.isValidEmail else {
            return
        }
        sendButton.changeStatus(to: .startLoading)
        FBService.shared.resetPassword(email: email) { [weak self] (result) in
            guard let strongSelf = self else { return }
            strongSelf.sendButton.changeStatus(to: .stopLoading)
            switch result {
            case .success:
                print("Reset sent!")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func hideTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
