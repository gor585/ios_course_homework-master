//
//  ViewController.swift
//  TableView AutoLayout
//
//  Created by Jaroslav Stupinskyi on 31.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var mainTableView = UITableView()
    
    var itemsArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainTableView)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        //        let screenWidth = self.view.bounds.width
        //        let screenHight = self.view.bounds.height
        //        let navBarHeight = UIApplication.shared.statusBarFrame.size.height
        //        mainTableView.frame = CGRect(x: 0, y: navBarHeight, width: screenWidth, height: screenHight)
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.mainTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = CGFloat(mainTableView.bounds.height * 0.13)
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        
        let date = UILabel()
        let title = UILabel()
        let text = UILabel()
        
        date.text = "Date"
        title.text = "Title"
        text.text = "Text"
        
        date.textAlignment = .center
        title.textAlignment = .center
        text.textAlignment = .center
        
        date.backgroundColor = UIColor.cyan
        title.backgroundColor = UIColor.yellow
        text.backgroundColor = UIColor.red
        
        date.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        date.addConstraints([
            NSLayoutConstraint(item: date, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: mainTableView.bounds.width),
            NSLayoutConstraint(item: date, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: cell.contentView.bounds.height * 0.33)
            ])
        
        title.addConstraints([
            NSLayoutConstraint(item: title, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: mainTableView.bounds.width),
            NSLayoutConstraint(item: title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: cell.contentView.bounds.height * 0.33)
            ])
        
        text.addConstraints([
            NSLayoutConstraint(item: text, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: mainTableView.bounds.width),
            NSLayoutConstraint(item: text, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: cell.contentView.bounds.height * 0.33)
            ])
        
        
        let cellStackView = UIStackView(arrangedSubviews: [date, title, text])
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.axis = .vertical
        cellStackView.distribution = .fillEqually
        cellStackView.alignment = .center
        cellStackView.spacing = 8.0
        
        cell.addSubview(cellStackView)
        
        cellStackView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        cellStackView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        cellStackView.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count + 1
    }
    
    
    
}
