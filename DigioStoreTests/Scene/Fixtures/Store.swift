//
//  Store.swift
//  DigioStoreTests
//
//  Created by kilmer on 05/09/24.
//

import Foundation
@testable import DigioStore

extension Store {
    static func fixture(
        spotlight: [Spotlight] = [.fixture()],
        products: [Product] = [.fixture()],
        cash: Cash = .fixture()
    ) -> Self {
        .init(spotlight: spotlight, products: products, cash: cash)
    }
}
