//
//  UIImageView+Extension.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    /// An async image downloader and also used to cache images in memory.
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
}

extension UIView {
    func cornerRadius(_ value: CGFloat, borderWidth: CGFloat = .zero, borderColor: UIColor? = nil) {
        layer.masksToBounds = true
        layer.cornerRadius = value
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
    }
}
