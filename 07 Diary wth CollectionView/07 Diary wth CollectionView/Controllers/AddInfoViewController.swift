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
    @IBOutlet weak var textText: UITextView!
    @IBOutlet weak var chooseImgButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseImgButton.layer.borderColor = UIColor.gray.cgColor
        chooseImgButton.layer.borderWidth = 0.8
        
        submitButton.layer.borderWidth = 0.2
        submitButton.layer.borderColor = UIColor.black.cgColor
    }

    //MARK: Actions
    
    @IBAction func chooseImgButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
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
            delegate?.userCreatedNewItem(title: titleText.text!, text: textText.text!)
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }    
}

