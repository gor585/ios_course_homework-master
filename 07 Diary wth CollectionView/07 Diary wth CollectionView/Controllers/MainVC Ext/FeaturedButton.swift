//
//  FeaturedButton.swift
//  07 Diary wth CollectionView
//
//  Created by Jaroslav Stupinskyi on 27.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    @objc func featuredButtonPressed(_ sender: UIButton) {
        let cell = sender.superview?.superview as! CollectionCell
        let indexOfCell = collectionView.indexPath(for: cell)
        if itemsArray[(indexOfCell?.row)!].featured == false {
            itemsArray[(indexOfCell?.row)!].featured = true
            UIView.animate(withDuration: 0.5, animations: {
                sender.backgroundColor = UIColor.yellow
            })
        } else {
            itemsArray[(indexOfCell?.row)!].featured = false
            UIView.animate(withDuration: 0.5, animations: {
                sender.backgroundColor = UIColor.lightGray
            })
        }
        
        appendFeaturedItemsArray()
    }
}
