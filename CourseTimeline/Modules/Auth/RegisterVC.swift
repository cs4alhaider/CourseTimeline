//
//  RegisterVC.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit
import Helper4Swift
import CoreLocation

class RegisterVC: BaseViewController {
    
    @IBOutlet weak var firstName: TextField!
    @IBOutlet weak var lastName: TextField!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var registerButton: LoaderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func registerTapped(_ sender: LoaderButton) {
        registerNewUser()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func registerNewUser() {
        guard let email = emailTextField.text,
        let password = passwordTextField.text,
        email.isValidEmail, password.count > 5 else {
            return
        }
        registerButton.changeStatus(to: .startLoading)
        FBService.shared.createUser(withEmail: email,
                                    password: password,
                                    firstName: firstName.text,
                                    lastName: lastName.text) { [weak self] (result) in
            self?.registerButton.changeStatus(to: .stopLoading)
            switch result {
            case .success:
                RouteKit.changeRootWindow(to: .home, withNavigation: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
