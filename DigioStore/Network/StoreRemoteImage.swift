//
//  StoreRemoteImage.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation
import UIKit

protocol StoreRemoteImageProtocol {
    func request(_ endpoint: StoreEndpoint, completion: @escaping (Result<UIImage, StoreError>) -> Void)
}

final class StoreRemoteImage: StoreNetworkRequestBuilder, StoreRemoteImageProtocol {
    func request(_ endpoint: StoreEndpoint, completion: @escaping (Result<UIImage, StoreError>) -> Void) {
        guard let request = buildRequest(endpoint) else {
            completion(.failure(.badURL))
            return
        }

        let task = URLSession.shared.dataTask(
            with: request
        ) { data, _, error in

            guard error == nil else {
                completion(.failure(.requestFailed))
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                completion(.failure(.unknown))
                return
            }

            completion(.success(image))
        }

        task.resume()
    }
}
