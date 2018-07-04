//
//  ItemModel.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import Foundation
import UIKit

class Item {
    let currentDate = Date()
    var date = ""
    var title: String?
    var text: String?
    var featured: Bool
    
    init(title: String? = "", text: String? = "") {
        self.title = title
        self.text = text
        self.featured = false
        
        date = dateString(dateToString: currentDate)
    }
}
