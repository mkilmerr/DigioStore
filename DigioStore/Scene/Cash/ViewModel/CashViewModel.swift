//
//  CashViewModel.swift
//  DigioStore
//
//  Created by Kilmer on 05/09/24.
//

import Foundation
import UIKit

protocol CashViewModelProtocol {
    func loadCashBanner(from cash: Cash)
    func createCashBanner(from cash: Cash, result: Result<UIImage, StoreError>) -> CashBanner
    var onBannerLoaded: ((CashBanner) -> Void)? { get set }
}

struct CashBanner {
    let title: String
    let image: UIImage?
    let description: String
}

final class CashViewModel: CashViewModelProtocol {
    var onBannerLoaded: ((CashBanner) -> Void)?
    let service: StoreRemoteImageProtocol

    init(service: StoreRemoteImageProtocol) {
        self.service = service
    }

    func loadCashBanner(from cash: Cash) {
        service.request(.getRemoteImage(cash.bannerURL)) { [weak self] result in
            guard let self else { return }

            DispatchQueue.main.async {
                let banner = self.createCashBanner(
                    from: cash,
                    result: result
                )

                self.onBannerLoaded?(banner)
            }
        }
    }

    func createCashBanner(
        from cash: Cash,
        result: Result<UIImage, StoreError>
    ) -> CashBanner {
        let image: UIImage?

        switch result {
        case .success(let remoteImage):
            image = remoteImage
        case .failure:
            image = UIImage(named: "")
        }

        return .init(
            title: cash.title,
            image: image,
            description: cash.description
        )
    }
}
