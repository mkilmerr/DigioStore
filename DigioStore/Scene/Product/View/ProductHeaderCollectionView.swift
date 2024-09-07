//
//  ProductHeaderCollectionView.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

class ProductHeaderCollectionView: UICollectionReusableView {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Produtos"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
