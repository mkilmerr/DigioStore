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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let initialViewController = HomeViewController(
            viewModel: HomeViewModel(
                service: StoreNetworkService()
            )
        )

        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()

        return true
    }
}
