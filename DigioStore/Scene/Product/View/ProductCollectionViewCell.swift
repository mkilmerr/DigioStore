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
    
    private lazy var bannerImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
    
    public func setup(with banner: ProductBanner) {
        bannerImageView.image = banner.image
    }

    private func setupView() {
        layer.cornerRadius = 24
        layer.masksToBounds = true
        backgroundColor = .white
        
        applyShadow()
        
      
        addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bannerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bannerImageView.widthAnchor.constraint(equalToConstant: 72),
            bannerImageView.heightAnchor.constraint(equalToConstant: 72),
           
        ])
    }
}

