//
//  FeaturedViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 04.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class FeaturedViewController: UITableViewController {
    
    var newItemsArray = [Item]()
    
    override func viewWillAppear(_ animated: Bool) {
        newItemsArray = Featured.sharedInstance.featuredItemsArray
        
        newItemsArray = Featured.sharedInstance.featuredItemsArray
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newItemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell else { return UITableViewCell() }
        
        newItemsArray.sort { $0.date > $1.date }
        
        cell.titleLabel.text = newItemsArray[indexPath.row].title!
        cell.tagLabel.text = newItemsArray[indexPath.row].tags!
        cell.dateLabel.text = newItemsArray[indexPath.row].date
        cell.inputTextLabel.text = newItemsArray[indexPath.row].text
        
        return cell
    }
}
