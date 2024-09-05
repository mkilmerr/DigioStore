//
//  Product.swift
//  DigioStoreTests
//
//  Created by kilmer on 05/09/24.
//

import Foundation
@testable import DigioStore

extension Product {
    static func fixture(
        name: String = "mock",
        imageURL: String = "mock",
        description: String = "mock"
    ) -> Self {
        .init(name: name, imageURL: imageURL, description: description)
    }
}
