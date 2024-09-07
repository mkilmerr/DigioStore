//
//  ProductHeaderView.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import Foundation
import UIKit

final class ProductHeaderView: UIView {
    private let headerImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "mainIcon")
        )
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "Produtos"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [headerLabel]
        )
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
