//
//  SpotlightCoordinator.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import Foundation
import UIKit

protocol SpotlightNavigation {
    func goToSpotlightDetail(with spotlight: Spotlight)
    func goBackSpotlight()
}

final class SpotlightCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var childrenCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(UIViewController(), animated: true)
    }
}
