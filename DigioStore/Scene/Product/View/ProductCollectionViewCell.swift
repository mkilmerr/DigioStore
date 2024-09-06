//
//  ProductCollectionViewCell.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()

    private let bannerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.backgroundColor = .white
        view.applyShadow(
            shadowOffset: CGSize(width: 5, height: 5)
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(with banner: ProductBanner) {
        bannerImageView.image = banner.image
    }

    private func setupView() {
        addSubview(bannerView)
        bannerView.addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bannerImageView.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor),
            bannerImageView.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor),
            bannerImageView.widthAnchor.constraint(equalToConstant: 72),
            bannerImageView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
}

