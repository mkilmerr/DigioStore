//
//  HomeCoordinator.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController: HomeViewController = .make()
        navigationController.pushViewController(viewController, animated: true)
    }
}
