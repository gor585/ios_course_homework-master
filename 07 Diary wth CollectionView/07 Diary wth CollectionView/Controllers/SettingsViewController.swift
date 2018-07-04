//
//  SettingsViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 22.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func switchViewsPressed(_ sender: UISwitch) {
        if (sender.isOn == false) {
            let switchTableToCollectionNotificationName = Notification.Name(switchTableToCollectionKey)
            NotificationCenter.default.post(name: switchTableToCollectionNotificationName, object: nil)
        } else {
            let switchCollectionToTableNotificationName = Notification.Name(switchCollectionToTableKey)
            NotificationCenter.default.post(name: switchCollectionToTableNotificationName, object: nil)
        }
    }
   
    @IBAction func switchColorTheme(_ sender: UISwitch) {
        if (sender.isOn == false) {
            let switchColorThemeToBlackNotificationName = Notification.Name(switchColorThemeToBlackKey)
            NotificationCenter.default.post(name: switchColorThemeToBlackNotificationName, object: nil)
        } else {
            let switchColorThemeToWhiteNotificationName = Notification.Name(switchColorThemeToWhiteKey)
            NotificationCenter.default.post(name: switchColorThemeToWhiteNotificationName, object: nil)
        }
    }
    
}
