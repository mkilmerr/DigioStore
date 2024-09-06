//
//  SpotlightCollectionViewDataSource.swift
//  DigioStore
//
//  Created by Kilmer on 05/09/24.
//

import Foundation
import UIKit

final class SpotlightCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var spotlightBanners: [SpotlightBanner]
    
    init(spotlightBanners: [SpotlightBanner]) {
        self.spotlightBanners = spotlightBanners
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        spotlightBanners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier, for: indexPath) as? SpotlightCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup(with: spotlightBanners[indexPath.row])
        
        return cell
    }
}
