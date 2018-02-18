//
//  _RSSMultimedia.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import ObjectMapper

class RSSMultimediaDTO: Mappable {

    var url: String?
    var format: String?
    var height: Int?
    var width: Int?
    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        format <- map["format"]
        height <- map["height"]
        width <- map["width"]
        type <- map["type"]
        subtype <- map["subtype"]
        caption <- map["caption"]
        copyright <- map["copyright"]
    }
    
}
