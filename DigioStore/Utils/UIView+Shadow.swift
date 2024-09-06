//
//  UIView+Shadow.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

extension UIView {
    func applyShadow(
        shadowColor: CGColor = UIColor.black.cgColor,
        shadowOpacity: Float = 0.2,
        shadowOffset: CGSize = .init(width: 0, height: 5),
        shadowRadius: CGFloat = 1
    ) {
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
