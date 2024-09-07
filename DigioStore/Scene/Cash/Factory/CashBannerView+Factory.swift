//
//  CashBannerView+Factory.swift
//  DigioStore
//
//  Created by Kilmer on 06/09/24.
//

import Foundation

extension CashBannerView {
    static func make() -> CashBannerView {
        let service = StoreRemoteImage()
        let viewModel = CashViewModel(service: service)
        return .init(viewModel: viewModel)
    }
}
