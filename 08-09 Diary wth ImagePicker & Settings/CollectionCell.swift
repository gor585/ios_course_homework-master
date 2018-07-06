//
//  CollectionCell.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 22.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var featuredButton: UIButton!
    
    @IBOutlet weak var photoContainer: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoContainer.layer.cornerRadius = 10
        photoContainer.layer.masksToBounds = true
        photoContainer.clipsToBounds = true
        
        featuredButton.layer.cornerRadius = 10
        featuredButton.layer.borderColor = UIColor.black.cgColor
        featuredButton.layer.borderWidth = 0.2
        
        textLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textLabel.layer.cornerRadius = 10
        textLabel.layer.masksToBounds = true
        textLabel.clipsToBounds = true
        
        titleLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        titleLabel.layer.cornerRadius = 10
        titleLabel.layer.masksToBounds = true
        titleLabel.clipsToBounds = true
    }
}
