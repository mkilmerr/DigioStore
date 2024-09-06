//
//  SpotlightCollectionViewCell.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import UIKit

final class SpotlightCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    private lazy var bannerImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(with banner: SpotlightBanner) {
        bannerImageView.image = banner.image
    }

    private func setupView() {
        layer.cornerRadius = 24
        layer.masksToBounds = true
        applyShadow()
        
        addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 24)
        ])
    }
}
