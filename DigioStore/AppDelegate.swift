//
//  AppDelegate.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .black
        coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator?.start()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
