//
//  _RSSResult.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

class RSSResultDTO: Codable {
    
    var status: String?
    var copyright: String?
    var section: String?
    var lastUpdated: Date?
    var numResults: Int?
    var results: [RSSItemDTO]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }

}
