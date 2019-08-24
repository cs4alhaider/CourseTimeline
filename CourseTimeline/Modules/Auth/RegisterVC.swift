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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
    }
    
    @IBAction func registerTapped(_ sender: LoaderButton) {
        sender.changeStatus(to: .startLoading, duration: 0.7)
        registerNewUser()
    }
    
    func registerNewUser() {
        guard let email = emailTextField.text,
        let password = passwordTextField.text,
        email.isValidEmail, password.count > 2 else {
            
            return
        }
        
        FBService.shared.createUser(withEmail: email, password: password, firstName: firstName.text, lastName: lastName.text) { (error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // push
        }
    }
}
