//
//  UICollectionView+Extension.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import UIKit

extension UICollectionView {
    
    /// Instead of writing the cell identifiers in a text format;
    /// this method used to get the cell identifier value from the cell class name
    /// also it's used in data type casting in a generic way.
    func dequeueCell<T: NSObject>(_ type: T.Type, _ indexPath: IndexPath?) -> T? {
        
        if type.superclass() == UICollectionViewCell.self {
            return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath!) as? T
        } else if type.superclass() == UICollectionReusableView.self {
            return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: type), for: indexPath!) as? T
        } else { return nil }
    }
    /// Instead of writing the nib name in a text format;
    /// this method used to get the nib name value from the nib class name
    /// also it's used in data type casting in a generic way.
    func registerNib<T: NSObject>(className: T.Type) {
        
        let classStr = String(describing: className)
        let nib = UINib(nibName: classStr, bundle: nil)
        
        if className.superclass() == UICollectionViewCell.self {
            register(nib, forCellWithReuseIdentifier: classStr)
        } else if className.superclass() == UICollectionReusableView.self {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: classStr)
        }
    }
}
