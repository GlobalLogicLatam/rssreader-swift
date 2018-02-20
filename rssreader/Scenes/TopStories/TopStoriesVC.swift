//
//  TopStoriesVC.swift
//  rssreader
//
//  Created by Gerson on 18/02/2018.
//  Copyright (c) 2018 GlobalLogic. All rights reserved.
//

import UIKit

protocol TopStoriesDisplayLogic: class {
  func displayTopStories(viewModel: TopStories.Item.ViewModel)
}

class TopStoriesVC: UICollectionViewController, TopStoriesDisplayLogic {
  var interactor: TopStoriesBusinessLogic?
  var router: (NSObjectProtocol & TopStoriesRoutingLogic & TopStoriesDataPassing)?
  var displayedItems: [TopStories.Item.ViewModel.DisplayedItems] = []

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = TopStoriesInteractor()
    let presenter = TopStoriesPresenter()
    let router = TopStoriesRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getTopStories()
    
    if let patternImage = UIImage(named: "Pattern") {
        view.backgroundColor = UIColor(patternImage: patternImage)
    }
    collectionView?.backgroundColor = UIColor.clear
    collectionView?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    // Set the PinterestLayout delegate
    if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
        layout.delegate = self
    }
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func getTopStories() {
    interactor?.getTopStories()
  }
  
  func displayTopStories(viewModel: TopStories.Item.ViewModel) {
    displayedItems = viewModel.displayedItems
    self.collectionView?.reloadData()
  }
}

extension TopStoriesVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopStoryCollectionViewCell", for: indexPath)
        if let storyCell = cell as? TopStoryCollectionViewCell {
            storyCell.rssItem = displayedItems[indexPath.item]
        }
        return cell
    }
    
}

// MARK: PINTEREST LAYOUT DELEGATE

extension TopStoriesVC: PinterestLayoutDelegate {
    
    // 1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat(arc4random_uniform(201) + 120)
    }
    
}
