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
    private let productsCollectionView: ProductCollectionView = .make()
    private let contentScrollView = UIScrollView()
    private let productHeaderView = ProductHeaderView()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                headerView,
                spotlightCollectionView,
                cashBannerView,
                productHeaderView,
                productsCollectionView
            ]
        )
        stackView.spacing = 4
        stackView.setCustomSpacing(24, after: cashBannerView)
        stackView.axis = .vertical
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var alertController: UIAlertController = {
        let alertController = UIAlertController(
            title: "Ops....",
            message: "Tente Novamente",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.fetchStore()
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancelar",
            style: .cancel,
            handler: nil
        )
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        return alertController
    }()

    let viewModel: HomeViewModelProtocol
    let coordinator: Coordinator

    init(viewModel: HomeViewModelProtocol, coordinator: Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        fetchStore()
    }
}

// MARK: - Fetch Store
extension HomeViewController {
    private func fetchStore() {
        viewModel.getStore { [weak self] state in
            guard let self else { return }
            switch state {
            case .loading:
                setupLoading()
            case .success(let store):
                setupSuccessViews(with: store)
            case .error:
                present(alertController, animated: true, completion: nil)
            }
        }
    }
}

// MARK: - View State Configurations
extension HomeViewController {
    private func setupSuccessViews(with store: Store) {
        contentStackView.isHidden = false
        stopLoading()

        spotlightCollectionView.loadBanners(
            with: store.spotlight
        )

        cashBannerView.loadCashBanner(
            with: store.cash
        )

        productsCollectionView.loadProductBanner(
            with: store.products
        )
    }

    private func setupLoading() {
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        contentStackView.isHidden = true
      
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            activityIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }
    
    private func stopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
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
               equalToConstant: 200
            ),
            cashBannerView.heightAnchor.constraint(
                equalToConstant: 200
            ),
            productsCollectionView.heightAnchor.constraint(
               equalToConstant: 200
            )
        ])
    }
}
