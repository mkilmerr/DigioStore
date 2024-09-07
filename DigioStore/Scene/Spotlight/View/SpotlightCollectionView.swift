//
//  SpotlightCollectionView.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

protocol SpotlightCollectionActionDelegate: AnyObject {
    func goToDetail(with spotlight: SpotlightBanner)
}

final class SpotlightCollectionView: UICollectionView {
    weak var delegateView: SpotlightCollectionActionDelegate?
    private var viewModel: SpotlightViewModelProtocol
    private let collectionDataSource: SpotlightCollectionViewDataSource = .init(spotlightBanners: [])
    private let collectionDelegate = SpotlightCollectionViewDelegate()

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
        self.backgroundColor = .accentColor

        self.register(
            SpotlightCollectionViewCell.self,
            forCellWithReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier
        )

        self.collectionDelegate.onTapItem = { [weak self] banner in
            self?.delegateView?.goToDetail(with: banner)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func loadBanners(with spotlights: [Spotlight]) {
        viewModel.loadSpotlightBannertItens(spotlights)

        viewModel.onBannersLoaded = { [weak self] in
            guard let self else { return }
            collectionDataSource.spotlightBanners = self.viewModel.spotlightBanners
            collectionDelegate.spotlightBanners = self.viewModel.spotlightBanners
            self.reloadData()
        }
    }
}
