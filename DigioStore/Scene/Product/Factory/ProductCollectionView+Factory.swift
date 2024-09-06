//
//  ProductCollectionView+Factory.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import Foundation

extension ProductCollectionView {
    static func make() -> ProductCollectionView {
        let service = StoreRemoteImage()
        let viewModel = ProductViewModel(service: service)
        let view = ProductCollectionView(viewModel: viewModel)
        
        return view
    }
}
