//
//  SettingsViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 22.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell") else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
   

}
