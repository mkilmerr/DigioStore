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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.backgroundColor = .lightGray // Customize as needed
        contentView.layer.cornerRadius = 24
        contentView.layer.masksToBounds = true
    }
}
