//
//  Notifications.swift
//  07 Diary wth CollectionView
//
//  Created by Jaroslav Stupinskyi on 27.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.reloadItemArrayData(notification:)), name: editNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.switchTableToGrid(notification:)), name: switchTableToCollectionNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.switchGridToTable(notification:)), name: switchCollectionToTableNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.switchColorThemeToBlack(notification:)), name: switchColorThemeToBlackNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.switchColorThemeToWhite(notification:)), name: switchColorThemeToWhiteNotificationName, object: nil)
    }
    
    @objc func reloadItemArrayData(notification: NSNotification) {
        collectionView.reloadData()
    }
    
    @objc func switchTableToGrid(notification: NSNotification) {
        collectionViewGridLayout()
    }
    
    @objc func switchGridToTable(notification: NSNotification) {
        collectionViewTableLayout()
    }
    
    @objc func switchColorThemeToBlack(notification: NSNotification) {
        whiteColorTheme = false
    }
    
    @objc func switchColorThemeToWhite(notification: NSNotification) {
        whiteColorTheme = true
    }
}
