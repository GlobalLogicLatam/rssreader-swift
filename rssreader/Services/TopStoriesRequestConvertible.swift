//
//  TopStoriesRequestConvertible.swift
//  rssreader
//
//  Created by Gerson on 17/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import Foundation
import Alamofire

enum TopStoriesRequestConvertible: URLRequestConvertible {
    
    static let baseURLString = Bundle.main.object(forInfoDictionaryKey: "BaseURLKey") as? String
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKey") as? String
    
    case getTopStories([String: AnyObject])
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getTopStories:
            return .get
        }
    }
    
    var fullPath: URLComponents {
        switch self {
        case .getTopStories(let params):
            let pathURL = URL(string: TopStoriesRequestConvertible.baseURLString!)!
            var urlComp = URLComponents()
            urlComp.host = pathURL.host
            urlComp.scheme = pathURL.scheme
            urlComp.port = pathURL.port
            urlComp.path = "topstories/v2/home.json"
            var qParams = params
            qParams["api-key"] = TopStoriesRequestConvertible.apiKey as AnyObject
            var queryStringParams = [URLQueryItem]()
            for (key, value) in qParams {
                queryStringParams.append(URLQueryItem(name: key, value: value as? String))
            }
            urlComp.queryItems = queryStringParams
            return urlComp
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var mutableURLRequest = URLRequest(url: fullPath.url!)
        mutableURLRequest.httpMethod = method.rawValue
        return mutableURLRequest
    }
}
