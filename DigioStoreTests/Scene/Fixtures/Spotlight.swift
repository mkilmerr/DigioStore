//
//  Spotlight.swift
//  DigioStoreTests
//
//  Created by kilmer on 05/09/24.
//

import Foundation
@testable import DigioStore

extension Spotlight {
    static func fixture(
        name: String = "mock",
        bannerURL: String = "mock",
        description: String = "mock"
    ) -> Self {
        .init(name: name, bannerURL: bannerURL, description: description)
    }
}
