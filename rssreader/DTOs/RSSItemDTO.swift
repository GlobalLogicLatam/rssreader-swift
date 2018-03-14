//
//  _RSSItem.swift
//  rssreader
//
//  Created by Gerson on 15/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

class RSSItemDTO: Codable {
    
    var section: String?
    var subsection: String?
    var title: String?
    var abstract: String?
    var url: URL?
    var shortUrl: URL?
    var byline: String?
    var itemType: String?
    var updatedDate: Date?
    var createdDate: Date?
    var publishedDate: Date?
    var materialTypeFacet: String?
    var kicker: String?
    var multimedia: [RSSMultimediaDTO]?
    
    enum CodingKeys: String, CodingKey {
        case section
        case subsection
        case title
        case abstract
        case url
        case shortUrl = "short_url"
        case byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case multimedia
    }
    
}
