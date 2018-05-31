//
//  DetailsViewController.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import UIKit

//Make sence to create another file for protocol, but this is optional
protocol PassBackEditedData {
    func editedItemPassed(title: String, tags: String, text: String)
    func userDeletedItem(atIndex: Int?)
}

class DetailsViewController: UIViewController, DetailEditing {
    
    var delegate: PassBackEditedData?
    
    @IBOutlet weak var titleDetailsLabel: UILabel!
    @IBOutlet weak var tagDetailsLabel: UILabel!
    @IBOutlet weak var dateDetaislLabel: UILabel!
    @IBOutlet weak var textDetailsLabel: UITextView!
    @IBOutlet weak var editButton: UIButton!
    
    var cell: Item?
    var selectedRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleDetailsLabel.text = cell?.title
        tagDetailsLabel.text = cell?.tags
        dateDetaislLabel.text = cell?.date
        textDetailsLabel.text = cell?.text
        
        delegate?.editedItemPassed(title: cell?.title ?? "", tags: cell?.tags ?? "", text: cell?.text ?? "")
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditing" {
            let editingVC = segue.destination as! EditingViewController
            editingVC.cell = cell
            editingVC.delegate = self
        }
    }
    
    func addDeletedImage() {
        titleDetailsLabel.text = "Record deleted"
        tagDetailsLabel.text = ""
        textDetailsLabel.text = ""
        
        editButton.isEnabled = false
        editButton.isHidden = true
        dateDetaislLabel.isHidden = true
        tagDetailsLabel.isHidden = true
        textDetailsLabel.isHidden = true
        
        view.backgroundColor = UIColor.gray
        
        let deleteImageName: String? = "delete"
        let deleteImageView = UIImageView(image: UIImage(named: deleteImageName ?? ""))
        self.view.addSubview(deleteImageView)
        
//        deleteImageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.2, height: self.view.bounds.height * 0.13)
//        deleteImageView.center = self.view.center
        
        deleteImageView.contentMode = .scaleAspectFit
        deleteImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: deleteImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: self.view.bounds.width * 0.09),
            NSLayoutConstraint(item: deleteImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: self.view.bounds.height * 0.07),
            NSLayoutConstraint(item: deleteImageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: deleteImageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
            ])
    }
    
    func userEditedItem(title: String, tags: String, text: String) {
        cell?.title = title
        cell?.tags = tags
        cell?.text = text
        
        viewDidLoad() // you DONT WANT to call methods of View Controller Lifecycle on your own! please come with better approach
    }
    
    func userDeletedItem() {
        addDeletedImage()
        delegate?.userDeletedItem(atIndex: selectedRow)
    }
}
