//
//  HomeViewController.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let spotlightCollectionView: SpotlightCollectionView = .make()
    private let cashBanner: CashBannerView = .make()

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
                spotlightCollectionView.loadBanners(with: store.spotlight)
                cashBanner.loadCashBanner(with: store.cash)
            case .error(let error):
                spotlightCollectionView.loadBanners(with: [])
            }
        }

        view.addSubview(spotlightCollectionView)
        view.addSubview(cashBanner)

        spotlightCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cashBanner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spotlightCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spotlightCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spotlightCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            spotlightCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            cashBanner.topAnchor.constraint(equalTo: spotlightCollectionView.bottomAnchor, constant: 32),
            cashBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cashBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
