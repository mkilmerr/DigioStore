//
//  StoreRemoteImageStub.swift
//  DigioStoreTests
//
//  Created by Kilmer on 06/09/24.
//

import UIKit
@testable import DigioStore

final class StoreRemoteImageStub: StoreRemoteImageProtocol {
    var serviceCalled = false
    var failed = false

    func request(
        _ endpoint: StoreEndpoint,
        completion: @escaping (Result<UIImage, StoreError>) -> Void) {
        serviceCalled = true
        failed ? completion(.failure(.unknown)) : completion(.success(UIImage()))
    }
}
