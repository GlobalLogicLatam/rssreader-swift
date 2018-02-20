//
//  TopStoriesModels.swift
//  rssreader
//
//  Created by Gerson on 18/02/2018.
//  Copyright (c) 2018 GlobalLogic. All rights reserved.
//

import UIKit

enum TopStories {
  // MARK: Use cases
  enum Item {
    struct Request {
    }
    
    struct Response {
        var topStories: [RSSItem]
    }
    
    struct ViewModel {
        struct DisplayedItems {
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
            var multimedia: [Multimedia.ViewModel.DisplayedMultimedia]?
        }
        var displayedItems: [DisplayedItems]
    }
  }

  enum Multimedia {
      struct Request {
      }

      struct Response {
          var multimedias: [RSSMultimedia]
      }

      struct ViewModel {
          struct DisplayedMultimedia {
              var url: URL?
              var format: String?
              var height: Int?
              var width: Int?
              var type: String?
              var subtype: String?
              var caption: String?
          }
          var displayedMultimedia: [DisplayedMultimedia]
      }
  }
}
