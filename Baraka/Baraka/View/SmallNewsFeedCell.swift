//
//  SmallNewsFeedCell.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 28/05/2022.
//

import UIKit

class SmallNewsFeedCell: UICollectionViewCell {

    @IBOutlet weak var articleImage: UIImageView! {
        didSet {
            articleImage.cornerRadius(12.0, borderWidth: 0.5, borderColor: .systemGray)
        }
    }
    @IBOutlet weak var titleTextView: UITextView!
    var currentIndex = 0
    var article: Article! {
        didSet {
            articleImage.setImageWithIndicator(url: article.imageURL)
            titleTextView.text = article.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
