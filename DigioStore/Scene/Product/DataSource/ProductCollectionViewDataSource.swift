//
//  ProductCollectionViewDataSource.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

final class ProductCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var productBanners: [ProductBanner]

    init(productBanners: [ProductBanner]) {
        self.productBanners = productBanners
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productBanners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup(with: productBanners[indexPath.row])
        return cell
    }
}

