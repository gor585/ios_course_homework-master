//
//  MainTableTableViewController.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import UIKit

class MainTableViewController: UITableViewController {
    
    var itemsArray = [Item]()
    
    //MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            print("\(self.itemsArray[indexPath.row].title ?? "") deleted")
            self.itemsArray.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        return [delete]
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
}

extension MainTableViewController: AddItem {
    
    func userCreatedNewItem(title: String, tags: String, text: String) {
        
        let newItem = Item(title: title, tags: tags, text: text)
        itemsArray.append(newItem)
        
        tableView.reloadData()
    }
}

extension MainTableViewController: PassBackEditedData {

    func editedItemPassed(title: String, tags: String, text: String) {

        tableView.reloadData()
    }
    
    func userDeletedItem(atIndex: Int?) {
        self.itemsArray.remove(at: atIndex ?? itemsArray.count + 1)
        tableView.reloadData()
    }
}
