//
//  DetailsViewController.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import UIKit

class DetailsViewController: UIViewController {
    
    var delegate: PassBackEditedData?
    
    @IBOutlet weak var titleDetailsLabel: UILabel!
    @IBOutlet weak var dateDetaislLabel: UILabel!
    @IBOutlet weak var textDetailsLabel: UITextView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var photoDetailsImage: UIImageView!
    
    @IBOutlet weak var titleEditingView: UITextView!
    @IBOutlet weak var textEditingView: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var photoEditingImage: UIImageView!
    @IBOutlet weak var changeImgEditButton: UIButton!
    
    var cell: Item?
    var selectedRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleDetailsLabel.text = cell?.title
        dateDetaislLabel.text = cell?.date
        textDetailsLabel.text = cell?.text
        
        titleEditingView.text = cell?.title
        textEditingView.text = cell?.text
        
        deleteButton.layer.borderWidth = 0.2
        deleteButton.layer.borderColor = UIColor.black.cgColor
        
        confirmButton.layer.borderWidth = 0.2
        confirmButton.layer.borderColor = UIColor.black.cgColor
        
        editButton.layer.borderWidth = 0.2
        editButton.layer.borderColor = UIColor.black.cgColor
        
        changeImgEditButton.layer.borderWidth = 0.8
        changeImgEditButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        editingModeBegin()
    }
    
    @IBAction func changeImgEditBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Item", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .default) { (actionCancel) in }
        let actionDelete = UIAlertAction(title: "Delete", style: .destructive) { (actionDelete) in
            self.delegate?.userDeletedItem(atIndex: self.selectedRow)
            self.dismiss(animated: true, completion: nil)
            self.addDeletedImage()
        }
            
            alert.addAction(actionCancel)
            alert.addAction(actionDelete)
            present(alert, animated: true, completion: nil)
    }
}

