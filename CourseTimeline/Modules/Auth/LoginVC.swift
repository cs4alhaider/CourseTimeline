//
//  LoginVC.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: LoaderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: LoaderButton) {
        handleLogin()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func handleLogin() {
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            email.isValidEmail, password.count > 2 else {
                return
        }
        // button loading..
        loginButton.changeStatus(to: .startLoading)
        // Sign in call..
        FBService.shared.signInUser(withEmail: email.trimmed, password: password) { (result) in
            self.loginButton.changeStatus(to: .stopLoading)
            switch result {
            case .success:
                RouteKit.changeRootWindow(to: .home, withNavigation: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
