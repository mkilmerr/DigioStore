//
//  ProductCollectionViewDelegate.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

final class ProductCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSizeMake(collectionView.frame.size.width / 2, collectionView.frame.size.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
