//
//  RouteKit.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 24/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Helper4Swift

struct RouteKit {
    
    private init() {}
    
    static func push(to screen: Screen, from vc: UIViewController? = UIApplication.topViewController()) {
        vc?.pushThis(screen.viewController)
    }
    
    static func present(screen: Screen, on vc: UIViewController? = UIApplication.topViewController()) {
        vc?.presentThis(screen.viewController)
    }
    
    static func changeRootWindow(to screen: Screen, withNavigation: Bool) {
        let currentVC = UIApplication.topViewController()
        let nv = BaseNavigationController(rootViewController: screen.viewController)
        currentVC?.view.window?.rootViewController = withNavigation ? nv : screen.viewController
        currentVC?.view.window?.makeKeyAndVisible()
    }
    
}

extension RouteKit {
    enum Screen {
        
        case welcome
        case register
        case login
        case home
        
        var viewController: UIViewController {
            switch self {
            case .welcome:
                return UIStoryboard.main.instantiateVC(withClass: WelcomeVC.self)
            case .register:
                return UIStoryboard.auth.instantiateVC(withClass: RegisterVC.self)
            case .login:
                return UIStoryboard.auth.instantiateVC(withClass: LoginVC.self)
            case .home:
                return UIStoryboard.home.instantiateVC(withClass: HomeVC.self)
            }
        }
        
    }
}
