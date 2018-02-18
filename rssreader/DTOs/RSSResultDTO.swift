//
//  _RSSResult.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import ObjectMapper

class RSSResultDTO: Mappable {
    
    var status: String?
    var copyright: String?
    var section: String?
    var lastUpdated: String?
    var numResults: Int?
    var results: [RSSItemDTO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        copyright <- map["copyright"]
        section <- map["section"]
        lastUpdated <- map["last_updated"]
        numResults <- map["num_results"]
        results <- map["results"]
    }

}
