//
//  HomeViewController.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let spotlightCollectionView = SpotlightCollectionView()

    let viewModel: HomeViewModelProtocol

    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getStore { state in
            switch state {
            case .loading:
                print("loading")
            case .success(let store):
                print("success \(store)")
            case .error(let error):
                print("error \(error)")
            }
        }

        view.addSubview(spotlightCollectionView)

        spotlightCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spotlightCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spotlightCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spotlightCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            spotlightCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
}
