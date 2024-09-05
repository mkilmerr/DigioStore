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

    static func getRemoteImage() -> Self {
        .init(
            url: URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png"),
            method: .get,
            body: nil,
            headers: nil
        )
    }
}
