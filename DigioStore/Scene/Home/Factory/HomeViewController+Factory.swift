//
//  HomeViewController+Factory.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

extension HomeViewController {
    static func make(with coordinator: HomeCoordinator) -> HomeViewController {
        let storeService = StoreNetworkService()
        let viewModel = HomeViewModel(service: storeService)
        let viewController = HomeViewController(
            viewModel: viewModel,
            coordinator: coordinator
        )

        return viewController
    }
}
