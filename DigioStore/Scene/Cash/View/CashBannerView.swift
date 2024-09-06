//
//  CashBannerView.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

final class CashBannerView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let bannerImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, bannerImageView])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    var viewModel: CashViewModelProtocol
    
    init(viewModel: CashViewModelProtocol) {
        self.viewModel = viewModel
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
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bannerImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
    
    public func loadCashBanner(with cash: Cash) {
        viewModel.loadCashBanner(from: cash)
        
        viewModel.onBannerLoaded = { [weak self] banner in
            self?.title.text = banner.title
            self?.bannerImageView.image = banner.image
        }
    }
}
