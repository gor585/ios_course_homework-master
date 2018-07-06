//
//  DetailsNotifications.swift
//  08-09 Diary wth ImagePicker & Settings
//
//  Created by Jaroslav Stupinskyi on 06.07.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

extension DetailsViewController {
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(DetailsViewController.switchColorThemeToBlack(notification:)), name: switchColorThemeToBlackNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DetailsViewController.switchColorThemeToWhite(notification:)), name: switchColorThemeToWhiteNotificationName, object: nil)
    }
    
    @objc func switchColorThemeToBlack(notification: NSNotification) {
        whiteColorTheme = false
    }
    
    @objc func switchColorThemeToWhite(notification: NSNotification) {
        whiteColorTheme = true
    }
}
