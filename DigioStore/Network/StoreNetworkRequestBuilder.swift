//
//  StoreNetworkRequestBuilder.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation

class StoreNetworkRequestBuilder {
    func buildRequest(_ endpoint: StoreEndpoint) -> URLRequest? {
        guard let url = endpoint.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        return request
    }
}
