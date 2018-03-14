//
//  _RSSMultimedia.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation

class RSSMultimediaDTO: Codable {

    var url: URL?
    var format: String?
    var height: Int?
    var width: Int?
    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    
}
