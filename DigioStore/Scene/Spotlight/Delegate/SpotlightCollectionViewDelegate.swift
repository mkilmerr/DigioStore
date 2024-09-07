//
//  SpotlightCollectionViewDelegate.swift
//  DigioStore
//
//  Created by Kilmer on 05/09/24.
//

import Foundation
import UIKit

final class SpotlightCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var spotlightBanners: [SpotlightBanner] = []
    
    var onTapItem: ((SpotlightBanner) -> Void)?

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSizeMake(collectionView.frame.size.width - 24, collectionView.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTapItem?(spotlightBanners[indexPath.row])
    }
}
