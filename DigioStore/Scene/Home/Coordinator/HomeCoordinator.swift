//
//  HomeCoordinator.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

protocol HomeCoordinatorProtocol: Coordinator, SpotlightNavigation {}

class HomeCoordinator: HomeCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    
    var childrenCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController.make(with: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func addChildCoordinator(_ child: Coordinator) {
        childrenCoordinators.append(child)
    }
    
    func removeChildCoordinator(_ child: Coordinator) {
        //childrenCoordinators = childrenCoordinators.filter { $0 !== child }
    }
    
    func goToSpotlightDetail(with spotlight: Spotlight) {
        let spotlightDetailViewController = UIViewController()
        let spotlightCoordinator = SpotlightCoordinator(navigationController: self.navigationController)
        addChildCoordinator(spotlightCoordinator)
        spotlightCoordinator.start()
    }
    
    func goBackSpotlight() {
        navigationController.popViewController(animated: true)
    }
}
