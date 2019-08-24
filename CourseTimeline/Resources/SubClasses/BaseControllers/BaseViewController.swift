//
//  BaseViewController.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetup()
        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func baseSetup() {
        view.backgroundColor = UIColor.View.background
        addKeyboardHidingGesture()
    }
    
    func setupUI() {}
    func setupTableView() {}
}
