//
//  Cash.swift
//  DigioStoreTests
//
//  Created by kilmer on 05/09/24.
//

import Foundation
@testable import DigioStore

extension Cash {
    static func fixture(
        title: String = "mock",
        bannerURL: String = "mock",
        description: String = "mock") -> Self {
        .init(title: title, bannerURL: bannerURL, description: description)
    }
}
