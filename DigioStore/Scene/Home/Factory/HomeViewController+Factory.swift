//
//  HomeViewController+Factory.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import Foundation

extension HomeViewController {
    static func make() -> HomeViewController {
        let storeService = StoreNetworkService()
        let viewModel = HomeViewModel(service: storeService)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
