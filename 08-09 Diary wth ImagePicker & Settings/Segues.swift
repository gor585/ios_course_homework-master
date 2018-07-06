//
//  Segues.swift
//  07 Diary wth CollectionView
//
//  Created by Jaroslav Stupinskyi on 27.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addInfo" {
            let secondVC = segue.destination as! AddInfoViewController
            secondVC.whiteColorTheme = whiteColorTheme
            secondVC.delegate = self
        }
        
        if segue.identifier == "toDetails" {
            let thirdVC = segue.destination as! DetailsViewController
            guard let selectedItem = sender as! CollectionCell? else { return }
            let indexPath = collectionView.indexPath(for: selectedItem)
            thirdVC.cell = itemsArray[(indexPath?.row)!]
            thirdVC.selectedRow = indexPath?.row
            thirdVC.delegate = self
        }
    }
}
