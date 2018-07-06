//
//  EditingPage.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 01.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

extension DetailsViewController {
    
    func editingModeBegin() {
        titleDetailsLabel.isHidden = true
        photoDetailsImage.isHidden = true
        textDetailsLabel.isHidden = true
        editButton.isEnabled = false
        editButton.isHidden = true
        deleteButton.isEnabled = false
        deleteButton.isHidden = true
        
        titleEditingView.isHidden = false
        photoEditingImage.isHidden = false
        textEditingView.isHidden = false
        changeImgEditButton.isHidden = false
        changeImgEditButton.isEnabled = true
        confirmButton.isHidden = false
        confirmButton.isEnabled = true
    }
    
    func editingModeEnded() {
        titleDetailsLabel.isHidden = false
        photoDetailsImage.isHidden = false
        textDetailsLabel.isHidden = false
        editButton.isEnabled = true
        editButton.isHidden = false
        deleteButton.isEnabled = true
        deleteButton.isHidden = false
        
        titleEditingView.isHidden = true
        photoEditingImage.isHidden = true
        textEditingView.isHidden = true
        changeImgEditButton.isHidden = true
        changeImgEditButton.isEnabled = false
        confirmButton.isHidden = true
        confirmButton.isEnabled = false
    }
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm Changes", message: "Are you sure you want to save changes to this item?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .default) { (actionCancel) in }
        let actionConfirm = UIAlertAction(title: "Confirm", style: .destructive) { (actionDelete) in
            
            self.cell?.title = self.titleEditingView.text
            self.cell?.text = self.textEditingView.text
            self.cell?.image = self.photoEditingImage.image
            
            self.titleDetailsLabel.text = self.cell?.title
            self.textDetailsLabel.text = self.cell?.text
            self.photoDetailsImage.image = self.cell?.image
            
            let editNotificationName = Notification.Name(editingNotificationKey)
            NotificationCenter.default.post(name: editNotificationName, object: nil)
            
            //self.delegate?.editedItemPassed(title: self.cell?.title ?? "", tags: self.cell?.tags ?? "", text: self.cell?.text ?? "")
            self.editingModeEnded()
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionConfirm)
        present(alert, animated: true, completion: nil)
    }
    
}
