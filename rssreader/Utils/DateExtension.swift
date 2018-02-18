//
//  DateExtension.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

extension Date {
    
    static func parseDate(_ dateString: String?) -> Date? {
        let dateFormat = DateFormatter()
        dateFormat.timeZone = TimeZone(abbreviation: "UTC")
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        if let stringToFormat = dateString {
            return dateFormat.date(from: stringToFormat)
        } else {
            return nil
        }
    }
}
