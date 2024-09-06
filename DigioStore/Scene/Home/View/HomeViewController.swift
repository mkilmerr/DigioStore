//
//  HomeViewController.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

final class HomeViewController: UIViewController {
    private let headerView = HomeHeaderView()
    private let spotlightCollectionView: SpotlightCollectionView = .make()
    private let cashBannerView: CashBannerView = .make()
    private let productsBannerView: ProductCollectionView = .make()
    private let contentScrollView = UIScrollView()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [headerView, spotlightCollectionView, cashBannerView, productsBannerView]
        )
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
        setupView()
        setupConstraints()

        viewModel.getStore { [weak self] state in
            guard let self else { return }
            switch state {
            case .loading: break
            case .success(let store):
                spotlightCollectionView.loadBanners(with: store.spotlight)
                cashBannerView.loadCashBanner(with: store.cash)
                productsBannerView.loadProductBanner(with: store.products)
//                productsBannerView.
            case .error(let error):
                spotlightCollectionView.loadBanners(with: [])
            }
        }
    }
}

// MARK: - Setup View and Constraints
extension HomeViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(contentScrollView)
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        setupContentScrollConstraints()
        setupContentStackConstraints()
        setupBannersConstraints()
    }
    
    private func setupContentScrollConstraints() {
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            contentScrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            contentScrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            contentScrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            )
        ])
    }
    
    private func setupContentStackConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(
                equalTo: contentScrollView.contentLayoutGuide.leadingAnchor
            ),
            contentStackView.trailingAnchor.constraint(
                equalTo: contentScrollView.contentLayoutGuide.trailingAnchor
            ),
            contentStackView.topAnchor.constraint(
                equalTo: contentScrollView.contentLayoutGuide.topAnchor,
                constant: 10
            ),
            contentStackView.bottomAnchor.constraint(
                equalTo: contentScrollView.contentLayoutGuide.bottomAnchor
            ),
            contentStackView.widthAnchor.constraint(
                equalTo: contentScrollView.frameLayoutGuide.widthAnchor
            )
        ])
    }
    
    private func setupBannersConstraints() {
        NSLayoutConstraint.activate([
            spotlightCollectionView.heightAnchor.constraint(
                equalTo: contentScrollView.heightAnchor,
                multiplier: 0.3
            ),
            cashBannerView.heightAnchor.constraint(
                equalTo: contentScrollView.heightAnchor,
                multiplier: 0.3
            ),
            productsBannerView.heightAnchor.constraint(
                equalTo: contentScrollView.heightAnchor,
                multiplier: 0.3
            )
        ])
    }
}
