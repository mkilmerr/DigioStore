//
//  CashViewModelTests.swift
//  DigioStoreTests
//
//  Created by Kilmer on 06/09/24.
//

import XCTest
@testable import DigioStore

final class CashViewModelTests: XCTestCase {
    func test_storeRemoteService_called() {
        let (sut, storeRemoteImageStub) = makeSUT()
        sut.loadCashBanner(from: .fixture())
        XCTAssertTrue(storeRemoteImageStub.serviceCalled)
    }

    func test_loadCashBanner() {
        let (sut, _) = makeSUT()
        let cash: Cash = .fixture()
        
        sut.loadCashBanner(from: cash)
        
        sut.onBannerLoaded = { banner in
            XCTAssertEqual(cash.description, banner.description)
            XCTAssertEqual(cash.title, banner.title)
        }
    }

    func test_createCashBanner_resultSuccess() {
        let (sut, _) = makeSUT()
        let resultSuccess: Result<UIImage, StoreError> = .success(UIImage())
        let cash: Cash = .fixture()

        let banner = sut.createCashBanner(
            from: cash, result: resultSuccess
        )

        XCTAssertEqual(banner.title, cash.title)
        XCTAssertEqual(banner.description, cash.description)

        switch resultSuccess {
        case .success(let success):
            XCTAssertNotNil(success)
        case .failure(let failure):
            XCTFail("Undefined behavior \(failure)")
        }
    }

    func test_createCashBanner_resultFailure() {
        let (sut, _) = makeSUT()
        let resultFailure: Result<UIImage, StoreError> = .failure(.unknown)
        
        let cash: Cash = .fixture()
        
        let banner = sut.createCashBanner(
            from: cash,
            result: resultFailure
        )

        XCTAssertEqual(cash.title, banner.title)
        XCTAssertEqual(cash.description, banner.description)

        if case let .failure(failure) = resultFailure {
            XCTAssertEqual(failure, .unknown)
            XCTAssertNotNil(failure)
        } else {
            XCTFail("Unexpected success")
        }
    }
}

extension CashViewModelTests {
    func makeSUT() -> (CashViewModel, StoreRemoteImageStub) {
        let storeRemoteImageStub = StoreRemoteImageStub()
        let viewModel = CashViewModel(service: storeRemoteImageStub)
        return (viewModel, storeRemoteImageStub)
    }
}
