//
//  PassBackEditedData.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 31.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

protocol PassBackEditedData {
    //func editedItemPassed(title: String, tags: String, text: String)
    func userDeletedItem(atIndex: Int?)
}
