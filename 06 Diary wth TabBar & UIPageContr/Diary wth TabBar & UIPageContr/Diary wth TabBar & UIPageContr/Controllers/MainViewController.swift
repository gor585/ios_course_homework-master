//
//  MainViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 22.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var itemsArray = [Item]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let editNotificationName = Notification.Name(rawValue: editingNotificationKey)
    let switchTableToCollectionNotificationName = Notification.Name(switchTableToCollectionKey)
    let switchCollectionToTableNotificationName = Notification.Name(switchCollectionToTableKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        tableView.dataSource = self
        tableView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionViewGridLayout()
        
        tableView.isHidden = false
        collectionView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
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
    
    //MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        
        cell.collectionTitleLabel.text = itemsArray[indexPath.item].title
        cell.collectionDateLabel.text = itemsArray[indexPath.item].date
        
        return cell
    }
    
    func collectionViewGridLayout() {
        let width = (view.frame.size.width - 30) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
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
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.reloadItemArrayData(notification:)), name: editNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.switchTableToCollection(notification:)), name: switchTableToCollectionNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.switchCollectionToTable(notification:)), name: switchCollectionToTableNotificationName, object: nil)
    }
    
    @objc func reloadItemArrayData(notification: NSNotification) {
        tableView.reloadData()
    }
    
    @objc func switchTableToCollection(notification: NSNotification) {
        tableView.isHidden = true
        collectionView.isHidden = false
    }
    
    @objc func switchCollectionToTable(notification: NSNotification) {
        tableView.isHidden = false
        collectionView.isHidden = true
    }
}

//MARK: - Extensions

extension MainViewController: AddItem {
    func userCreatedNewItem(title: String, tags: String, text: String) {
        let newItem = Item(title: title, tags: tags, text: text)
        itemsArray.append(newItem)
        tableView.reloadData()
    }
}

extension MainViewController: PassBackEditedData {
    
    //    func editedItemPassed(title: String, tags: String, text: String) {
    //        tableView.reloadData()
    //    }
    
    func userDeletedItem(atIndex: Int?) {
        self.itemsArray.remove(at: atIndex ?? itemsArray.count + 1)
        tableView.reloadData()
    }
}

extension MainViewController {
    func appendFeaturedItemsArray() {
        Featured.sharedInstance.featuredItemsArray = itemsArray.filter {$0.featured == true}
    }
}
