//
//  Coordinator.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    func start()
}
