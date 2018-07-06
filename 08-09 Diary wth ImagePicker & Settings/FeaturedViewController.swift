//
//  FeaturedViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 04.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newItemsArray = [Item]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topFeaturedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        applySubViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        newItemsArray = Featured.sharedInstance.featuredItemsArray
        tableView.reloadData()
    }
    
    func applySubViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topFeaturedLabel.bottomAnchor).isActive = true
        
        topFeaturedLabel.translatesAutoresizingMaskIntoConstraints = false
        topFeaturedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topFeaturedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topFeaturedLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topFeaturedLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        
        self.view.addConstraint(NSLayoutConstraint(item: topFeaturedLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: tableView.frame.height / 9))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell else { return UITableViewCell() }
        
        newItemsArray.sort { $0.date > $1.date }
        
        cell.titleLabel.text = newItemsArray[indexPath.row].title!
        cell.dateLabel.text = newItemsArray[indexPath.row].date
        cell.inputTextLabel.text = newItemsArray[indexPath.row].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
