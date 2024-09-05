//
//  SpotlightCollectionView.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

class SpotlightCollectionView: UICollectionView {
    var viewModel: SpotlightViewModelProtocol

    init(viewModel: SpotlightViewModelProtocol) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 350, height: 250)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        self.viewModel = viewModel
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.viewModel.delegate = self

        self.backgroundColor = .red
        self.showsHorizontalScrollIndicator = false
        self.dataSource = self
        self.delegate = self

        self.register(
            SpotlightCollectionViewCell.self,
            forCellWithReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func loadView(with spotlights: [Spotlight]) {
        
    }
}

extension SpotlightCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCollectionViewCell.reuseIdentifier, for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension SpotlightCollectionView: SpotlightViewModelDelegate {
    func updateView() {
        reloadData()
    }
}
