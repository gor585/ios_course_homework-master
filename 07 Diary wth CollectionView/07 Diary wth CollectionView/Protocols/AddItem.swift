//
//  AddItem.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 01.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

protocol AddItem {
    func userCreatedNewItem(title: String, image: UIImage, text: String)
}
