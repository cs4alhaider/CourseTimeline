//
//  TimelineCollectionViewCell.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 26/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

class TimelineCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    func setupViews() {
        backView.backgroundColor = UIColor.View.white
        backView.applyShadowWithRoundCorners(shadowColor: UIColor.Shadow.primary,
                                             cornerRadius: 12,
                                             shadowOpacity: 0.2,
                                             shadowOffset: CGSize(width: 0, height: 0),
                                             shadowRadius: 25)
        
    }
}
