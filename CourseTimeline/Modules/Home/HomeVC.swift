//
//  HomeVC.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Helper4Swift

class HomeVC: BaseViewController {

    @IBOutlet weak var userImage: ImageView!
    @IBOutlet weak var logoutButton: LightLoaderButton!
    @IBOutlet weak var titleLabel: Label!
    @IBOutlet weak var subTitleLabel: Label!
    @IBOutlet weak var tableView: TableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.titleLabel?.font = Identity.font(.custom(weight: .regular, size: 15))
        // Do any additional setup after loading the view.
    }
    

    override func setupUI() {
        setupLabels()
    }
    
    override func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibCell(nibWithCellClass: TimelineTableViewCell.self)
    }
    
    func setupLabels() {
        titleLabel.textColor = UIColor.View.white
        titleLabel.font = Identity.font(.h1)
        
        // subTitleLabel
        let text = NSMutableAttributedString()
        text
            .bold("20", font: Identity.font(.h1), color: UIColor.View.white)
            .bold(" timelines..", font: Identity.font(.h4), color: UIColor.View.white)
        subTitleLabel.attributedText = text
    }
    
    @IBAction func logoutTapped(_ sender: LightLoaderButton) {
        FBService.shared.logoutUser { (result) in
            switch result {
            case .success:
                RouteKit.changeRootWindow(to: .welcome, withNavigation: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

// MARK:- UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}

// MARK:- UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withClass: TimelineTableViewCell.self, for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
