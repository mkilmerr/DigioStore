//
//  HomeCoordinator.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

protocol SpotlightNavigation {
    func goToSpotlightDetail(with spotlight: SpotlightBanner)
}

protocol HomeCoordinatorProtocol: Coordinator, SpotlightNavigation {}

class HomeCoordinator: HomeCoordinatorProtocol {
    var navigationController: UINavigationController?
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController.make(with: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToSpotlightDetail(with spotlight: SpotlightBanner) {
        let spotlightDetailViewController = SpotlightDetailViewController(
            sportlight: spotlight
        )
    
        navigationController?.pushViewController(
            spotlightDetailViewController,
            animated: true
        )
    }
    
    func goBackSpotlight() {
        navigationController?.popViewController(animated: true)
    }
}
