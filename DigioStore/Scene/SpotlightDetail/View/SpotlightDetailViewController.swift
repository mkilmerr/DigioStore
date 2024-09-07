//
//  SpotlightDetailViewController.swift
//  DigioStore
//
//  Created by Kilmer on 07/09/24.
//

import UIKit

final class SpotlightDetailViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.textColor = .black
        return label
    }()
    
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            nameLabel,
            descriptionLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let sportlight: SpotlightBanner

    init(sportlight: SpotlightBanner) {
        self.sportlight = sportlight
        super.init(nibName: nil, bundle: nil)
        self.setupView(with: sportlight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(contentStackView)
    
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            contentStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 8
            ),
            view.trailingAnchor.constraint(
                equalTo: contentStackView.trailingAnchor,
                constant: 8
            ),
            imageView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.2
            )
        ])
    }
    
    private func setupView(with spolight: SpotlightBanner) {
        nameLabel.text = spolight.name
        descriptionLabel.text = spolight.description
        imageView.image = spolight.image
    }
}
