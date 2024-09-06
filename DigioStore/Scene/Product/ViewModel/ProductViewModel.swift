//
//  ProductViewModel.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import UIKit

protocol ProductViewModelProtocol {
    func loadProductBannerItens(_ products: [Product])
    func createProductBanner(
        from item: Product,
        result: Result<UIImage, StoreError>
    ) -> ProductBanner
    var productBanners: [ProductBanner] { get }
    var onBannersLoaded: (() -> Void)? { get set }
}

struct ProductBanner {
    let name: String
    let image: UIImage?
    let description: String
}

final class ProductViewModel: ProductViewModelProtocol {
    var productBanners: [ProductBanner] = []
    var onBannersLoaded: (() -> Void)?

    let service: StoreRemoteImageProtocol

    init(service: StoreRemoteImageProtocol) {
        self.service = service
    }
    
    func loadProductBannerItens(_ products: [Product]) {
        products.forEach { product in
            service.request(.getRemoteImage(product.imageURL)) { result in
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    let banner = createProductBanner(from: product, result: result)
                    self.productBanners.append(banner)
                    
                    if products.count == productBanners.count {
                        self.onBannersLoaded?()
                    }
                }
            }
        }
    }
    
    func createProductBanner(
        from item: Product,
        result: Result<UIImage, StoreError>
    ) -> ProductBanner {
        let image: UIImage?

        switch result {
        case .success(let remoteImage):
            image = remoteImage
        case .failure:
            image = UIImage(named: "")
        }

        return .init(name: item.name, image: image, description: item.description)
    }
}
