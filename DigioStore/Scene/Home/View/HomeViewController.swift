//
//  HomeViewController.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    private var spotlightCollectionView: SpotlightCollectionView = .make()

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

        viewModel.getStore { [weak self] state in
            guard let self else { return }
            switch state {
            case .loading: break
            case .success(let store):
                spotlightCollectionView.loadView(with: store.spotlight)
            case .error(let error):
                spotlightCollectionView.loadView(with: [])
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
