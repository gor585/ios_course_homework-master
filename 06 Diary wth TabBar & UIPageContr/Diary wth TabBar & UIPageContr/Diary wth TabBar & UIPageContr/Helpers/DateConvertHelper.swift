//
//  DateConvertHelper.swift
//  Diary
//
//  Created by Jaroslav Stupinskyi on 04.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import Foundation
import UIKit

extension Item {
    func dateString(dateToString: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd MM yyyy"
        let stringDate = dateFormatter.string(from: dateToString)
        
        return stringDate
    }
}
