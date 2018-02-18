//
//  RSSMultimedia.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class RSSMultimedia {
    
    var url: UIImageView?
    var format: String?
    var height: Int?
    var width: Int?
    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    
    init(_ multimediaDTO: RSSMultimediaDTO) {
        if let urlImage = multimediaDTO.url {
            url = UIImageView()
            url?.kf.setImage(with: URL.init(string: urlImage))
        }
        format = multimediaDTO.url
        height = multimediaDTO.height
        width = multimediaDTO.width
        type = multimediaDTO.type
        subtype = multimediaDTO.subtype
        caption = multimediaDTO.caption
        copyright = multimediaDTO.copyright
    }
    
}
