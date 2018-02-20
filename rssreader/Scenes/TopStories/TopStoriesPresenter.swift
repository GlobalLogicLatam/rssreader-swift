//
//  TopStoriesPresenter.swift
//  rssreader
//
//  Created by Gerson on 18/02/2018.
//  Copyright (c) 2018 GlobalLogic. All rights reserved.
//

import UIKit

protocol TopStoriesPresentationLogic {
  func presentTopStories(response: TopStories.Item.Response)
}

class TopStoriesPresenter: TopStoriesPresentationLogic {
  weak var viewController: TopStoriesDisplayLogic?
  
  // MARK: Do something
  
  func presentTopStories(response: TopStories.Item.Response) {
    
    var displayedItems: [TopStories.Item.ViewModel.DisplayedItems] = []
    for topStory in response.topStories {
        var displayedMultimedias: [TopStories.Multimedia.ViewModel.DisplayedMultimedia] = []
        if let multimediaArray = topStory.multimedia {
            for multimedia in multimediaArray {
                let displayedMultimedia = TopStories.Multimedia.ViewModel.DisplayedMultimedia(url: multimedia.url, format: multimedia.format, height: multimedia.height, width: multimedia.width, type: multimedia.type, subtype: multimedia.subtype, caption: multimedia.caption)
                displayedMultimedias.append(displayedMultimedia)
            }
        }
        let displayedItem = TopStories.Item.ViewModel.DisplayedItems(section: topStory.section, subsection: topStory.subsection, title: topStory.title, abstract: topStory.abstract, url: topStory.url, shortUrl: topStory.shortUrl, byline: topStory.byline, itemType: topStory.itemType, updatedDate: topStory.updatedDate, createdDate: topStory.createdDate, publishedDate: topStory.publishedDate, materialTypeFacet: topStory.materialTypeFacet, kicker: topStory.kicker, multimedia: displayedMultimedias)
        displayedItems.append(displayedItem)
    }
    
    let viewModel = TopStories.Item.ViewModel(displayedItems: displayedItems)
    viewController?.displayTopStories(viewModel: viewModel)
  }
}
