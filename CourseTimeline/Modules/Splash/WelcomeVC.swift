//
//  ViewController.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 22/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Helper4Swift

class WelcomeVC: BaseViewController {

    @IBOutlet weak var welcomeLabel: Label!
    @IBOutlet weak var createAccountLabel: Label!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // validateUser()
    }

    @IBAction func createAccountTapped(_ sender: LoaderButton) {
        RouteKit.push(to: .register)
    }
    
    @IBAction func loginTapped(_ sender: LightLoaderButton) {
        RouteKit.push(to: .login)
    }
    
    func validateUser() {
        if FBService.shared.userIsLoggedIn() {
            // userIsLoggedIn()
        } else {
            // userIsNotLoggedIn()
        }
    }
    
    override func setupUI() {
        setupWelcomeLabel()
        setupCreateAccountLabel()
    }
    
    func setupWelcomeLabel() {
        let text = NSMutableAttributedString()
        text
            .bold("Welcome\n", font: Identity.font(.h1), color: UIColor.Text.white)
            .bold("to timeline app", font: Identity.font(.custom(weight: .thin, size: 25)), color: UIColor.Text.white)
        welcomeLabel.attributedText = text
    }
    
    func setupCreateAccountLabel() {
        let text = NSMutableAttributedString()
        text
            .bold("Create a new account or login now", font: Identity.font(.custom(weight: .thin, size: 25)), color: UIColor.Text.light)
        createAccountLabel.attributedText = text
    }
    
}

