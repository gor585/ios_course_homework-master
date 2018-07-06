//
//  CollectionLayout.swift
//  07 Diary wth CollectionView
//
//  Created by Jaroslav Stupinskyi on 27.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    @objc func collectionViewGridLayout() {
        let width = (view.frame.size.width - 30) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
    }
    
    @objc func collectionViewTableLayout() {
        let width = view.frame.size.width - 30
        let height = view.frame.size.height / 5
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
    }
    
    func applyChosenLayout() {
        let layoutToGrid: Bool = defaults.bool(forKey: "switchCollectionLayout")
        if layoutToGrid == false {
            collectionViewGridLayout()
        } else {
            collectionViewTableLayout()
        }
    }
}
