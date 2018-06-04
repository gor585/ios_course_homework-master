//
//  ItemModel.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 10.05.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.

import Foundation
import UIKit

class Item {
    // Make sence to create separate DateHelper and inject this logic there
    func dateString(dateToString: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd MM yyyy"
        let stringDate = dateFormatter.string(from: dateToString)
        
        return stringDate
    }
    
    let currentDate = Date()
    var date = ""
    var title: String?
    var tags: String?
    var text: String?
    
    init(title: String? = "", tags: String? = "", text: String? = "") {
        self.title = title
        self.tags = tags
        self.text = text
        
        date = dateString(dateToString: currentDate)
    }
    
}
