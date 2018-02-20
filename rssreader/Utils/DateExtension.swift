//
//  DateExtension.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

extension Date {
    static func getFormattedDate(_ string: String?, _ formatter: String?) -> Date {
        let dateFormatterGet = DateFormatter()
        if let formatterVal = formatter {
            dateFormatterGet.dateFormat = formatterVal
        } else {
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-hh:mm"
        }
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        let date: Date? = dateFormatterGet.date(from: string ?? Date().description)
        return date!
    }
}
