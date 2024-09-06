//
//  ProductCollectionView.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

final class ProductCollectionView: UICollectionView {
    var viewModel: ProductViewModelProtocol
    let collectionDataSource: ProductCollectionViewDataSource = .init(productBanners: [])
    let collectionDelegate = ProductCollectionViewDelegate()
    
    init(viewModel: ProductViewModelProtocol) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10

        self.viewModel = viewModel
        super.init(frame: .zero, collectionViewLayout: layout)

        self.showsHorizontalScrollIndicator = false
        self.dataSource = collectionDataSource
        self.delegate = collectionDelegate

        self.register(
            ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func loadProductBanner(with product: [Product]) {
        viewModel.loadProductBannerItens(product)
        
        viewModel.onBannersLoaded = { [weak self] in
            guard let self else { return }
            self.collectionDataSource.productBanners = self.viewModel.productBanners
            self.reloadData()
        }
    }
}
