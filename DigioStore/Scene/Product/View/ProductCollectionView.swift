//
//  ProductCollectionView.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

protocol ProductCollectionActionDelegate: AnyObject {
    func goToDetail(with product: ProductBanner)
}

final class ProductCollectionView: UICollectionView {
    weak var delegateView: ProductCollectionActionDelegate?
    var viewModel: ProductViewModelProtocol
    let collectionDataSource: ProductCollectionViewDataSource = .init(productBanners: [])
    let collectionDelegate = ProductCollectionViewDelegate()
    
    init(viewModel: ProductViewModelProtocol) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 16)

        self.viewModel = viewModel
        super.init(frame: .zero, collectionViewLayout: layout)

        self.showsHorizontalScrollIndicator = false
        self.dataSource = collectionDataSource
        self.delegate = collectionDelegate
        self.backgroundColor = .accentColor

        self.register(
            ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier
        )
        
        self.collectionDelegate.onTapItem = { [weak self] banner in
            self?.delegateView?.goToDetail(with: banner)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func loadProductBanner(with product: [Product]) {
        viewModel.loadProductBannerItens(product)
        
        viewModel.onBannersLoaded = { [weak self] in
            guard let self else { return }
            self.collectionDataSource.productBanners = self.viewModel.productBanners
            self.collectionDelegate.productBanners = self.viewModel.productBanners
            self.reloadData()
        }
    }
}
