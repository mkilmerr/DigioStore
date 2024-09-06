//
//  SpotlightViewModel.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation
import UIKit

protocol SpotlightViewModelProtocol {
    func loadSpotlightBannertItens(_ spotlights: [Spotlight])
    func createSpotlightBanner(from item: Spotlight, result: Result<UIImage, StoreError>) -> SpotlightBanner
    var spotlightBanners: [SpotlightBanner] { get }
    var onBannersLoaded: (() -> Void)? { get set }
}

struct SpotlightBanner {
    let name: String
    let image: UIImage?
    let description: String
}

final class SpotlightViewModel: SpotlightViewModelProtocol {
    var onBannersLoaded: (() -> Void)?

    var spotlightBanners: [SpotlightBanner] = []
    let service: StoreRemoteImageProtocol

    init(service: StoreRemoteImageProtocol) {
        self.service = service
    }

    func loadSpotlightBannertItens(_ spotlights: [Spotlight]) {
        spotlights.forEach { spotlight in
            service.request(.getRemoteImage(spotlight.bannerURL)) { result in
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    let banner = createSpotlightBanner(from: spotlight, result: result)
                    self.spotlightBanners.append(banner)
                    
                    if spotlights.count == spotlightBanners.count {
                        self.onBannersLoaded?()
                    }
                }
            }
        }
    }

    func createSpotlightBanner(
        from item: Spotlight,
        result: Result<UIImage, StoreError>
    ) -> SpotlightBanner {
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
