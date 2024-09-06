//
//  UIImage+Remote.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

extension UIImage {
    static func loadRemote(with result: Result<UIImage, StoreError>) -> UIImage? {
        let image: UIImage?

        switch result {
        case .success(let remoteImage):
            image = remoteImage
        case .failure:
            image = UIImage(named: "")
        }
        
        return image
    }
}
