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
        url = itemDTO.url
        shortUrl = itemDTO.shortUrl
        byline = itemDTO.byline
        itemType = itemDTO.itemType
        updatedDate = itemDTO.updatedDate
        createdDate = itemDTO.createdDate
        publishedDate = itemDTO.publishedDate
        materialTypeFacet = itemDTO.materialTypeFacet
        kicker = itemDTO.kicker
        var multimediaArray = [RSSMultimedia]()
        for multimediaDTO in itemDTO.multimedia! {
            multimediaArray.append(RSSMultimedia.init(multimediaDTO))
        }
        multimedia = multimediaArray
    }

}
