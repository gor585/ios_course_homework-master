//
//  ImageDeletedView.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 01.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import Foundation
import UIKit

extension DetailsViewController {
    
    func addDeletedImage() {
        titleDetailsLabel.text = "Record deleted"
        tagDetailsLabel.text = ""
        textDetailsLabel.text = ""
        
        editButton.isEnabled = false
        editButton.isHidden = true
        deleteButton.isEnabled = false
        deleteButton.isHidden = true
        dateDetaislLabel.isHidden = true
        tagDetailsLabel.isHidden = true
        textDetailsLabel.isHidden = true
        
        view.backgroundColor = UIColor.gray
        
        let deleteImageName: String? = "delete"
        let deleteImageView = UIImageView(image: UIImage(named: deleteImageName ?? ""))
        self.view.addSubview(deleteImageView)
        
        deleteImageView.contentMode = .scaleAspectFit
        deleteImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: deleteImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: self.view.bounds.width * 0.09),
            NSLayoutConstraint(item: deleteImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: self.view.bounds.height * 0.07),
            NSLayoutConstraint(item: deleteImageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: deleteImageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
            ])
    }
}
