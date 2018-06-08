//
//  MainTableTableViewController.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import UIKit

class MainTableViewController: UITableViewController {
    
    var itemsArray = [Item]()
    
    let editNotificationName = Notification.Name(rawValue: editingNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell else { return UITableViewCell() }
        
        itemsArray.sort { $0.date > $1.date }
        
        cell.titleLabel.text = itemsArray[indexPath.row].title
        cell.tagLabel.text = itemsArray[indexPath.row].tags
        cell.dateLabel.text = itemsArray[indexPath.row].date
        cell.inputTextLabel.text = itemsArray[indexPath.row].text
        
        if itemsArray[indexPath.row].featured == true {
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.clear
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            print("\(self.itemsArray[indexPath.row].title ?? "") deleted")
            self.itemsArray.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        var feature = UITableViewRowAction(style: .normal, title: "Feature") { (action, indexPath) in
            self.itemsArray[indexPath.row].featured = true
            self.appendFeaturedItemsArray()
            self.tableView.reloadData()
        }
        
        let unFeature = UITableViewRowAction(style: .normal, title: "Unfeature") { (action, indexPath) in
            self.itemsArray[indexPath.row].featured = false
            self.appendFeaturedItemsArray()
            self.tableView.reloadData()
        }
        
        if itemsArray[indexPath.row].featured == true {
            feature = unFeature
        }
        
        feature.backgroundColor = UIColor.yellow
        unFeature.backgroundColor = UIColor.gray
        
        return [delete, feature]
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //It is usseful to have Constants file with constants like segue identifiers, etc;
        if segue.identifier == "addInfo" {
            let secondVC = segue.destination as! AddInfoViewController
            secondVC.delegate = self
        }
        
        if segue.identifier == "toDetails" {
            let thirdVC = segue.destination as! DetailsViewController
            thirdVC.cell = itemsArray[(tableView.indexPathForSelectedRow?.row)!]
            thirdVC.selectedRow = tableView.indexPathForSelectedRow?.row
            thirdVC.delegate = self
        }
    }
    
    //MARK: - Notifications
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(MainTableViewController.reloadItemArrayData(notification:)), name: editNotificationName, object: nil)
    }
    
    @objc func reloadItemArrayData(notification: NSNotification) {
        tableView.reloadData()
    }
    
}

//MARK: - Extensions

extension MainTableViewController: AddItem {
    
    func userCreatedNewItem(title: String, tags: String, text: String) {
        let newItem = Item(title: title, tags: tags, text: text)
        itemsArray.append(newItem)
        tableView.reloadData()
    }
}

extension MainTableViewController: PassBackEditedData {

//    func editedItemPassed(title: String, tags: String, text: String) {
//        tableView.reloadData()
//    }

    func userDeletedItem(atIndex: Int?) {
        self.itemsArray.remove(at: atIndex ?? itemsArray.count + 1)
        tableView.reloadData()
    }
}

extension MainTableViewController {
    func appendFeaturedItemsArray() {
        Featured.sharedInstance.featuredItemsArray = itemsArray.filter {$0.featured == true}
    }
}

