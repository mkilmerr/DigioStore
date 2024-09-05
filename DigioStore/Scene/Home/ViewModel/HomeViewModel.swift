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
    var onViewStatus: ((HomeViewModelState) -> Void)? { get }
    func getStore()
}

final class HomeViewModel: HomeViewModelProtocol {
    var onViewStatus: ((HomeViewModelState) -> Void)?
    let service: StoreNetworkServiceProtocol

    init(service: StoreNetworkServiceProtocol) {
        self.service = service
    }

    func getStore() {
        onViewStatus?(.loading)

        service.request(.homeStore()) { [weak self] (result: Result<Store, StoreError>) in
            switch result {
            case .success(let result):
                self?.onViewStatus?(.success(result))
            case .failure(let error):
                self?.onViewStatus?(.error(error))
            }
        }
    }
}
