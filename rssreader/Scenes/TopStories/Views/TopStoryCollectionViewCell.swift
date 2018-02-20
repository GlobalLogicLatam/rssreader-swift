//
//  TopStoryCollectionViewCell.swift
//  rssreader
//
//  Created by Gerson on 19/02/2018.
//  Copyright © 2018 GlobalLogic. All rights reserved.
//

import UIKit
import Kingfisher

class TopStoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var topStoryImageView: UIImageView!
    @IBOutlet fileprivate weak var topStoryTitleLB: UILabel!
    @IBOutlet fileprivate weak var topStoryCaptionLB: UILabel!
    @IBOutlet fileprivate weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    
    var rssItem: TopStories.Item.ViewModel.DisplayedItems? {
        didSet {
            if let rssItem = rssItem {
                let multimediaObj = rssItem.multimedia?.last
                topStoryImageView.kf.setImage(with: multimediaObj?.url as Resource?)
                topStoryTitleLB.text = rssItem.title
                topStoryCaptionLB.text = multimediaObj?.caption?.trunc(length: 100)
            }
        }
    }
}
