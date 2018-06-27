//
//  ViewController.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import UIKit

class AddInfoViewController: UIViewController {
    
    var delegate: AddItem?
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var tagText: UITextField!
    @IBOutlet weak var textText: UITextView!
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: Actions
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if titleText.text == "" {
            let alert = UIAlertController(title: "No title provided", message: "Please insert a title to your note", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: { (actionOk) in })
            let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: { (actionCancel) in
                self.dismiss(animated: true, completion: nil)
            })
            
            alert.addAction(actionOk)
            alert.addAction(actionCancel)
            present(alert, animated: true, completion: nil)
        } else {
            delegate?.userCreatedNewItem(title: titleText.text!, tags: tagText.text!, text: textText.text!)
            self.dismiss(animated: true, completion: nil)
        }
    }    
}

