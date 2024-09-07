//
//  SpotlightDetailViewController.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

final class SpotlightDetailViewController: UIViewController {
    let sportlight: SpotlightBanner

    init(sportlight: SpotlightBanner) {
        self.sportlight = sportlight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
