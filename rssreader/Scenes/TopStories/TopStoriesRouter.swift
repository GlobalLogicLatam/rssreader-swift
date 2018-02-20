//
//  TopStoriesRouter.swift
//  rssreader
//
//  Created by Gerson on 18/02/2018.
//  Copyright (c) 2018 GlobalLogic. All rights reserved.
//

import UIKit

@objc protocol TopStoriesRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol TopStoriesDataPassing {
  var dataStore: TopStoriesDataStore? { get }
}

class TopStoriesRouter: NSObject, TopStoriesRoutingLogic, TopStoriesDataPassing {
  weak var viewController: TopStoriesVC?
  var dataStore: TopStoriesDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: TopStoriesViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: TopStoriesDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
