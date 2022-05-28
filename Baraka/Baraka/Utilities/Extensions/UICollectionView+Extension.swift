//
//  UICollectionView+Extension.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import UIKit

extension UICollectionView {
    
    func dequeueCell<CellOrView: NSObject>(_ type: CellOrView.Type, _ indexPath: IndexPath?) -> CellOrView? {
        
        if type.superclass() == UICollectionViewCell.self {
            return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath!) as? CellOrView
        } else if type.superclass() == UICollectionReusableView.self {
            return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: type), for: indexPath!) as? CellOrView
        } else { return nil }
    }
    
    func registerNib<CellOrView: NSObject>(className: CellOrView.Type) {
        
        let classStr = String(describing: className)
        let nib = UINib(nibName: classStr, bundle: nil)
        
        if className.superclass() == UICollectionViewCell.self {
            register(nib, forCellWithReuseIdentifier: classStr)
        } else if className.superclass() == UICollectionReusableView.self {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: classStr)
        }
    }
}
