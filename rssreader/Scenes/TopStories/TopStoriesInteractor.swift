//
//  TopStoriesInteractor.swift
//  rssreader
//
//  Created by Gerson on 18/02/2018.
//  Copyright (c) 2018 GlobalLogic. All rights reserved.
//

protocol TopStoriesBusinessLogic {
  func getTopStories()
}

protocol TopStoriesDataStore {
  //var name: String { get set }
}

class TopStoriesInteractor: TopStoriesBusinessLogic, TopStoriesDataStore {
  var presenter: TopStoriesPresentationLogic?
  var worker: TopStoriesWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func getTopStories() {
    worker = TopStoriesWorker()
    var response = TopStories.Item.Response(topStories: [])
    worker?.getTopStories(success: {[weak self] (rssItems: [RSSItem]) in
        response = TopStories.Item.Response(topStories: rssItems)
        self?.presenter?.presentTopStories(response: response)
    }, failure: {[weak self] (err: Error?) in
        print("ERROR: \(err?.localizedDescription ?? "Unknown error")")
        self?.presenter?.presentTopStories(response: response)
    })
    
  }
}
