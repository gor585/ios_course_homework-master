//
//  ViewController.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import UIKit

class AddInfoViewController: UIViewController {
    
    var delegate: AddItem?
    
    var whiteColorTheme: Bool = true
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var textText: UITextView!
    @IBOutlet weak var chooseImgButton: UIButton!
    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseImgButton.layer.borderColor = UIColor.white.cgColor
        chooseImgButton.layer.borderWidth = 1
        
        submitButton.layer.borderWidth = 0.2
        submitButton.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if whiteColorTheme == false {
            self.view.backgroundColor = UIColor.black
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }

    //MARK: Actions
    
    @IBAction func chooseImgButtonPressed(_ sender: Any) {
        chooseImage()
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
            delegate?.userCreatedNewItem(title: titleText.text!, image: photoImg.image!, text: textText.text!)
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }    
}

extension AddInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Image Source", message: "Choose your image source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImg.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

