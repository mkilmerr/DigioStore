//
//  SpotlightCollectionView+Factory.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation

extension SpotlightCollectionView {
    static func make() -> SpotlightCollectionView {
        let storeRemoteImageService = StoreRemoteImage()

        let viewModel = SpotlightViewModel(
            service: storeRemoteImageService
        )

        let view = SpotlightCollectionView(viewModel: viewModel)
        return view
    }
}
