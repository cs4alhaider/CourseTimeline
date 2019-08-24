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
        let vc = vcFromStoryboard(withClass: RegisterVC.self, from: .auth)
        pushThis(vc)
    }
    
    @IBAction func loginTapped(_ sender: LightLoaderButton) {
    }
    
    func userIsNotLoggedIn() {
        let vc = vcFromStoryboard(withClass: RegisterVC.self, from: .auth)
        let nv = BaseNavigationController(rootViewController: vc)
        presentThis(nv)
    }
    
    func userIsLoggedIn() {
        let vc = vcFromStoryboard(withClass: HomeVC.self, from: .home)
        let nv = BaseNavigationController(rootViewController: vc)
        presentThis(nv)
    }
    
    func validateUser() {
        if FBService.shared.userIsLoggedIn() {
            userIsLoggedIn()
        } else {
            userIsNotLoggedIn()
        }
    }
    
    override func setupUI() {
        setupWelcomeLabel()
        setupCreateAccountLabel()
    }
    
    func setupWelcomeLabel() {
        let text = NSMutableAttributedString()
        text
            .bold("Welcome\n", font: Identity.font(.custom(weight: .bold, size: 27)), color: UIColor.Text.white)
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

