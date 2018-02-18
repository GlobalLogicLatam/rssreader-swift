//
//  _RSSItem.swift
//  rssreader
//
//  Created by Gerson on 15/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import ObjectMapper

class RSSItemDTO: Mappable {
    
    var section: String?
    var subsection: String?
    var title: String?
    var abstract: String?
    var url: String?
    var shortUrl: String?
    var byline: String?
    var itemType: String?
    var updatedDate: String?
    var createdDate: String?
    var publishedDate: String?
    var materialTypeFacet: String?
    var kicker: String?
    var multimedia: [RSSMultimediaDTO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        section <- map["section"]
        subsection <- map["subsection"]
        title <- map["title"]
        abstract <- map["abstract"]
        url <- map["url"]
        shortUrl <- map["short_url"]
        byline <- map["byline"]
        itemType <- map["item_type"]
        updatedDate <- map["updated_date"]
        createdDate <- map["created_date"]
        publishedDate <- map["published_date"]
        materialTypeFacet <- map["material_type_facet"]
        kicker <- map["kicker"]
        multimedia <- map["multimedia"]
    }
}
