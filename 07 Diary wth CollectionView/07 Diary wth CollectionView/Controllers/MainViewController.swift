//
//  MainViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 22.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var itemsArray = [Item]()
    
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
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionViewTableLayout()
        
        collectionView.allowsSelection = true
    }
    
    
    //MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        
        itemsArray.sort { $0.date > $1.date }
        
        cell.titleLabel.text = itemsArray[indexPath.item].title
        cell.dateLabel.text = itemsArray[indexPath.item].date
        cell.textLabel.text = itemsArray[indexPath.item].text
        
        cell.featuredButton.tag = indexPath.item
        cell.featuredButton.addTarget(self, action: #selector(featuredButtonPressed(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func featuredButtonPressed(_ sender: UIButton) {
        let cell = sender.superview?.superview as! CollectionCell
        let indexOfCell = collectionView.indexPath(for: cell)
        if itemsArray[(indexOfCell?.row)!].featured == false {
            itemsArray[(indexOfCell?.row)!].featured = true
            sender.backgroundColor = UIColor.yellow
        } else {
            itemsArray[(indexOfCell?.row)!].featured = false
            sender.backgroundColor = UIColor.lightGray
        }
        
        appendFeaturedItemsArray()
    }
    
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
}

//MARK: - Extensions

extension MainViewController: AddItem {
    func userCreatedNewItem(title: String, tags: String, text: String) {
        let newItem = Item(title: title, tags: tags, text: text)
        itemsArray.append(newItem)
        collectionView.reloadData()
    }
}

extension MainViewController: PassBackEditedData {
    func userDeletedItem(atIndex: Int?) {
        self.itemsArray.remove(at: atIndex ?? itemsArray.count + 1)
        collectionView.reloadData()
    }
}

extension MainViewController {
    func appendFeaturedItemsArray() {
        Featured.sharedInstance.featuredItemsArray = itemsArray.filter {$0.featured == true}
    }
}
