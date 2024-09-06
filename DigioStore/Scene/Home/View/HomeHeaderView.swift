//
//  HomeHeaderView.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

final class HomeHeaderView: UIView {
    private let headerImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "mainIcon")
        )
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "Olá, Maria"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [headerImageView, headerLabel]
        )
        stackView.spacing = 8
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
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerImageView.widthAnchor.constraint(equalToConstant: 32),
            headerImageView.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
