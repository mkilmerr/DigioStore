//
//  StoreNetworkService.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation

protocol StoreNetworkServiceProtocol {
    func request<T: Decodable>(
        _ endpoint: StoreEndpoint,
        completion: @escaping (Result<T, StoreError>) -> Void)
    func buildRequest(_ endpoint: StoreEndpoint) -> URLRequest?
}

final class StoreNetworkService: StoreNetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: StoreEndpoint, completion: @escaping (Result<T, StoreError>) -> Void) {

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

            guard let data else {
                completion(.failure(.unknown))
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decoding))
            }
        }

        task.resume()
    }

    func buildRequest(_ endpoint: StoreEndpoint) -> URLRequest? {
        guard let url = endpoint.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        return request
    }
}
