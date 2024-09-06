//
//  SpotlightCollectionView.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

final class SpotlightCollectionView: UICollectionView {
    var viewModel: SpotlightViewModelProtocol
    var collectionDataSource: SpotlightCollectionViewDataSource = .init(spotlightBanners: [])
    var collectionDelegate = SpotlightCollectionViewDelegate()

    init(viewModel: SpotlightViewModelProtocol) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 16)

        self.viewModel = viewModel
        super.init(frame: .zero, collectionViewLayout: layout)

        self.showsHorizontalScrollIndicator = false
        self.dataSource = collectionDataSource
        self.delegate = collectionDelegate

        self.register(
            SpotlightCollectionViewCell.self,
            forCellWithReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func loadBanners(with spotlights: [Spotlight]) {
        viewModel.loadSpotlightBannertItens(spotlights)
        
        viewModel.onBannersLoaded = { [weak self] in
            guard let self else { return }
            collectionDataSource.spotlightBanners = self.viewModel.spotlightBanners
            self.reloadData()
        }
    }
}
