//
//  UIImageView+Extension.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImageWithIndicator(url: String?, completion: ((UIImage?)->())? = nil) {
        guard let _ = url, let theUrl = URL(string: url!) else {
            image = UIImage(named: "")
            return
        }
        SDImageCache.shared.config.shouldCacheImagesInMemory = true
        sd_imageIndicator = SDWebImageActivityIndicator.gray
        sd_setImage(with: theUrl, placeholderImage: nil, options: .refreshCached, completed: { (downLoadedImage, error, cacheType, url) in
            completion?(downLoadedImage)
        })
    }
    
    func cornerRadius(_ value: CGFloat, borderWidth: CGFloat = .zero, borderColor: UIColor) {
        layer.masksToBounds = true
        layer.cornerRadius = value
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
