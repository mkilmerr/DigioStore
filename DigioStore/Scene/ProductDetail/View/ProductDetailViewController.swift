//
//  ProductDetailViewController.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 24
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return label
    }()
    
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel,
            imageView,
            descriptionLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let product: ProductBanner

    init(product: ProductBanner) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
        self.setupView(with: product)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .accentColor
        view.addSubview(contentStackView)
    
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            contentStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            view.trailingAnchor.constraint(
                equalTo: contentStackView.trailingAnchor,
                constant: 20
            ),
            imageView.heightAnchor.constraint(
               equalToConstant: 100
            )
        ])
    }
    
    private func setupView(with product: ProductBanner) {
        nameLabel.text = product.name
        descriptionLabel.text = product.description
        imageView.image = product.image
    }
}
