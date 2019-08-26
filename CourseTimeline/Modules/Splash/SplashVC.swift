//
//  SplashVC.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 25/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

class SplashVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // validateUser()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateUser()
    }
    
    func validateUser() {
        if FBService.shared.userIsLoggedIn() {
            RouteKit.present(screen: .home, withNavigation: true)
        } else {
            RouteKit.present(screen: .welcome, withNavigation: true)
        }
    }
    
    override func setupUI() {
        
    }
    
}
