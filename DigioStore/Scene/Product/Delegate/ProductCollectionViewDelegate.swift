//
//  ProductCollectionViewDelegate.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

final class ProductCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var productBanners: [ProductBanner] = []

    var onTapItem: ((ProductBanner) -> Void)?

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(
            width: collectionView.frame.size.width / 2.5,
            height: collectionView.frame.size.height / 2
        )
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTapItem?(productBanners[indexPath.row])
    }
}
