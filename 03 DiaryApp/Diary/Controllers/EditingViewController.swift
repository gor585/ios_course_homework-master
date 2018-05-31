//
//  EditingViewController.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 12.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import UIKit

protocol DetailEditing {
    func userEditedItem(title: String, tags: String, text: String)
    func userDeletedItem()
}

class EditingViewController: UIViewController {
    var cell: Item? // cell ?
    var delegate: DetailEditing?

    @IBOutlet weak var titleEditView: UITextView!
    @IBOutlet weak var tagsEditView: UITextField!
    @IBOutlet weak var textEditView: UITextView!
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleEditView.text = cell?.title
        tagsEditView.text = cell?.tags
        textEditView.text = cell?.text
    }
    
    //MARK: - Actions
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        delegate?.userEditedItem(title: titleEditView.text ?? "", tags: tagsEditView.text ?? "", text: textEditView.text ?? "")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Item", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .default) { (actionCancel) in }
        let actionDelete = UIAlertAction(title: "Delete", style: .destructive) { (actionDelete) in
            self.delegate?.userDeletedItem()
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionDelete)
        present(alert, animated: true, completion: nil)
    }
    
    
}
