//
//  StoreNetworkServiceStub.swift
//  DigioStoreTests
//
//  Created by kilmer on 05/09/24.
//

import Foundation
@testable import DigioStore

final class StoreNetworkServiceStub: StoreNetworkServiceProtocol {
    let hasError: Bool
    var serviceCalled = false

    init(hasError: Bool = false) {
        self.hasError = hasError
    }

    func request<T: Decodable>(_ endpoint: StoreEndpoint, completion: @escaping (Result<T, StoreError>) -> Void) {
        serviceCalled = true

        if hasError {
            completion(.failure(.unknown))
        } else {
            if let store = Store.fixture() as? T {
                completion(.success(store))
            } else {
                completion(.failure(.decoding))
            }
        }
    }

    func buildRequest(_ endpoint: StoreEndpoint) -> URLRequest? {
        nil
    }
}
