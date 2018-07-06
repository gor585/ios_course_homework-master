//
//  SettingsViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 22.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var switchCollectionLayoutButton: UISwitch!
    @IBOutlet weak var switchColorThemeButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchCollectionLayoutButton.isOn = defaults.bool(forKey: "switchCollectionLayout")
        switchColorThemeButton.isOn = defaults.bool(forKey: "switchColorTheme")
        sendNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sendNotifications()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func sendNotifications() {
        if switchCollectionLayoutButton.isOn == false {
            let switchTableToCollectionNotificationName = Notification.Name(switchTableToCollectionKey)
            NotificationCenter.default.post(name: switchTableToCollectionNotificationName, object: nil)
        } else {
            let switchCollectionToTableNotificationName = Notification.Name(switchCollectionToTableKey)
            NotificationCenter.default.post(name: switchCollectionToTableNotificationName, object: nil)
        }
        
        if switchColorThemeButton.isOn == false {
            let switchColorThemeToBlackNotificationName = Notification.Name(switchColorThemeToBlackKey)
            NotificationCenter.default.post(name: switchColorThemeToBlackNotificationName, object: nil)
        } else {
            let switchColorThemeToWhiteNotificationName = Notification.Name(switchColorThemeToWhiteKey)
            NotificationCenter.default.post(name: switchColorThemeToWhiteNotificationName, object: nil)
        }
    }
    
    @IBAction func switchViewsPressed(_ sender: UISwitch) {
        sendNotifications()
        saveSettings(setting: switchCollectionLayoutButton.isOn, key: "switchCollectionLayout")
    }
   
    @IBAction func switchColorTheme(_ sender: UISwitch) {
        sendNotifications()
        saveSettings(setting: switchColorThemeButton.isOn, key: "switchColorTheme")
    }
    
    func saveSettings(setting: Bool, key: String) {
        defaults.set(setting, forKey: key)
    }
    
}
