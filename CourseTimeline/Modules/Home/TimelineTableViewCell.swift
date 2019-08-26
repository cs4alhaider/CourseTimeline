//
//  TimelineTableViewCell.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 26/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionFlow: UPCarouselFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        backgroundColor = UIColor.View.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor.View.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: -30)
        collectionView.register(nibWithCellClass: TimelineCollectionViewCell.self)
        
        collectionFlow.sideItemScale = 1
        collectionFlow.sideItemShift = 0.0
        collectionFlow.sideItemAlpha = 1
        collectionFlow.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 0)
        
        collectionFlow.itemSize = CGSize(width: collectionView.frame.width - 60,
                                         height: collectionView.frame.height)
        collectionFlow.minimumLineSpacing = 0
        
    }
    
    
}

extension TimelineTableViewCell: UICollectionViewDelegateFlowLayout {
    // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //     return 0
    // }
    
    // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //     return 0
    // }
}

// MARK:- UICollectionViewDelegate
extension TimelineTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

// MARK:- UICollectionViewDataSource
extension TimelineTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: TimelineCollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}
