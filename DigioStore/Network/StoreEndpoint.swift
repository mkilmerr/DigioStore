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
