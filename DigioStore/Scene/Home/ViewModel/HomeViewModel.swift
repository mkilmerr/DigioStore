//
//  HomeViewModel.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation

enum HomeViewModelState {
    case loading
    case success(Store)
    case error(StoreError)
}

protocol HomeViewModelProtocol {
    func getStore(completion: @escaping (HomeViewModelState) -> Void)
}

final class HomeViewModel: HomeViewModelProtocol {
    let service: StoreNetworkServiceProtocol

    init(service: StoreNetworkServiceProtocol) {
        self.service = service
    }

    func getStore(completion: @escaping (HomeViewModelState) -> Void) {
        service.request(.homeStore()) { (result: Result<Store, StoreError>) in
            DispatchQueue.main.async {
                completion(.loading)
                switch result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.error(error))
                }
            }
        }
    }
}
