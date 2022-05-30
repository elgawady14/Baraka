//
//  LargeNewsFeedCell.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 29/05/2022.
//

import UIKit

class LargeNewsFeedCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.cornerRadius(12.0)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var currentIndex = 0
    var article: Article! {
        didSet {
            titleLabel.text = article.title
            articleImage.setImageWithIndicator(url: article.imageURL)
            dateLabel.text = article.date
            descriptionLabel.text = article.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
