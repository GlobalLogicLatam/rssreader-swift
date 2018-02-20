//
//  RSSItem.swift
//  rssreader
//
//  Created by Gerson on 15/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

class RSSItem {
    
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
    var multimedia: [RSSMultimedia]?
    
    init(_ itemDTO: RSSItemDTO) {
        section = itemDTO.section
        subsection = itemDTO.subsection
        title = itemDTO.title
        abstract = itemDTO.abstract
        if let itemURL = itemDTO.url {
            url = URL.init(string: itemURL)
        }
        if let itemShortURL = itemDTO.shortUrl {
            shortUrl = URL.init(string: itemShortURL)
        }
        byline = itemDTO.byline
        itemType = itemDTO.itemType
        updatedDate = Date.getFormattedDate(itemDTO.updatedDate, nil)
        createdDate = Date.getFormattedDate(itemDTO.createdDate, nil)
        publishedDate = Date.getFormattedDate(itemDTO.publishedDate, nil)
        materialTypeFacet = itemDTO.materialTypeFacet
        kicker = itemDTO.kicker
        var multimediaArray = [RSSMultimedia]()
        for multimediaDTO in itemDTO.multimedia! {
            multimediaArray.append(RSSMultimedia.init(multimediaDTO))
        }
        multimedia = multimediaArray
    }

}
