//
//  UIcollectionViewCell+Register.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    // MARK: REGISTER_COLLECTIONVIEWCELL_EXTENSION
    
    static func registerCollectionViewCell(for collectionView: UICollectionView)  {
        let cellName = String(describing: self)
        let cellIdentifier = cellName
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
}
