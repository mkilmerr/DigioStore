//
//  HomeViewModelTests.swift
//  DigioStoreTests
//
//  Created by kilmer on 05/09/24.
//

import XCTest
@testable import DigioStore

final class HomeViewModelTests: XCTestCase {
    func test_getStore_called() {
        let (sut, serviceStub) = makeSUT()

        sut.getStore(completion: { _ in })

        XCTAssertTrue(serviceStub.serviceCalled)

    }

    func test_getStore_not_called() {
        let (_, serviceStub) = makeSUT()
        XCTAssertFalse(serviceStub.serviceCalled)

    }

    func test_getStore_success() {
        let (sut, serviceStub) = makeSUT()

        sut.getStore(completion: { state in
            switch state {
            case .loading:
                XCTAssertTrue(serviceStub.serviceCalled)
            case .success(let store):
                XCTAssertNotNil(store)
            case .error(let error):
               XCTAssertNil(error)
            }
        })
    }

    func test_getStore_failure() {
        let (sut, serviceStub) = makeSUT(hasError: true)

        sut.getStore(completion: { state in
            switch state {
            case .loading:
                XCTAssertTrue(serviceStub.serviceCalled)
            case .success(let store):
                XCTAssertNil(store)
            case .error(let error):
               XCTAssertNotNil(error)
            }
        })
    }
}

// MARK: - Make SUT

extension HomeViewModelTests {
    func makeSUT(hasError: Bool = false) -> (HomeViewModel, StoreNetworkServiceStub) {
        let storeNetworkServiceStub = StoreNetworkServiceStub(
            hasError: hasError
        )

        let sut = HomeViewModel(service: storeNetworkServiceStub)
        return (sut, storeNetworkServiceStub)
    }
}
