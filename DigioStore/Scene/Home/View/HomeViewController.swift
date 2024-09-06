//
//  HomeViewController.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let spotlightCollectionView: SpotlightCollectionView = .make()
    private let cashBannerView: CashBannerView = .make()
    private let productsBannerView: CashBannerView = .make()

    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [spotlightCollectionView, cashBannerView, productsBannerView])
        stackView.spacing = 24
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

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
                cashBannerView.loadCashBanner(with: store.cash)
                productsBannerView.loadCashBanner(with: store.cash)
            case .error(let error):
                spotlightCollectionView.loadBanners(with: [])
            }
        }
        
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            spotlightCollectionView.heightAnchor.constraint(equalTo: contentStackView.heightAnchor, multiplier: 0.3),
            cashBannerView.heightAnchor.constraint(equalTo: spotlightCollectionView.heightAnchor, multiplier: 1.0)
        ])
    }
}
