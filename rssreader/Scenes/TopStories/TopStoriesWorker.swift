//
//  TopStoriesWorker.swift
//  rssreader
//
//  Created by Gerson on 18/02/2018.
//  Copyright (c) 2018 GlobalLogic. All rights reserved.
//

import Alamofire
import CodableAlamofire

protocol TopStoriesWorkerProtocol {
    func getTopStories(success: @escaping ([RSSItem]) -> Void, failure: @escaping (_ error: Error?) -> Void)
}

class TopStoriesWorker: TopStoriesWorkerProtocol {
    
    func getTopStories(success: @escaping ([RSSItem]) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    Alamofire.request((TopStoriesRequestConvertible.getTopStories([:]))).responseDecodableObject(decoder: decoder) { (response: DataResponse<RSSResultDTO>) in
        if let statusCode = response.response?.statusCode, statusCode < 400 {
            var rssItems = [RSSItem]()
            if let topStoriesResponse = response.result.value {
                for rssItemDTO in topStoriesResponse.results! {
                    rssItems.append(RSSItem.init(rssItemDTO))
                }
                success(rssItems)
            } else {
                failure(response.error)
            }
        } else {
            failure(response.error)
        }
    }
  }
    
}
