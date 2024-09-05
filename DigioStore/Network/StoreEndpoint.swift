//
//  StoreEndpoint.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation

struct StoreEndpoint {
    let url: URL?
    let method: StoreHTTPMethod
    let body: Data?
    let headers: [String: String]?
}

extension StoreEndpoint {
    static func homeStore() -> Self {
        .init(
            url: URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"),
            method: .get,
            body: nil,
            headers: nil
        )
    }

    static func getRemoteImage(_ url: String) -> Self {
        .init(
            url: URL(string: url),
            method: .get,
            body: nil,
            headers: nil
        )
    }
}
