//
//  SmallNewsFeedCell.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 28/05/2022.
//

import UIKit

class SmallNewsFeedCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.cornerRadius(12.0)
        }
    }
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var currentIndex = 0
    var article: Article! {
        didSet {
            articleImage.setImageWithIndicator(url: article.imageURL)
            titleLabel.text = article.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
