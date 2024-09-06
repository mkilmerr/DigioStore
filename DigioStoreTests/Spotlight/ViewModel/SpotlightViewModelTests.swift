//
//  SpotlightViewModelTests.swift
//  DigioStoreTests
//
//  Created by Kilmer on 06/09/24.
//

import XCTest
@testable import DigioStore

final class SpotlightViewModelTests: XCTestCase {
    func test_storeRemoteService_called() {
        let (sut, serviceStub) = makeSUT()
        
        sut.loadSpotlightBannertItens([.fixture()])
        
        XCTAssertTrue(serviceStub.serviceCalled)
    }
    
    func test_loadSpotlightBannertItens() {
        let (sut, _) = makeSUT()
        
        let spotlights: [Spotlight] = [
            .fixture(name: "mock 01"), .fixture(name: "mock 02")
        ]
        
        sut.loadSpotlightBannertItens(spotlights)
       
        sut.onBannersLoaded = {
            XCTAssertEqual(spotlights.count, sut.spotlightBanners.count)
        }
    }
    
    func test_createSpotlightBanner_resultSuccess() {
        let (sut, _) = makeSUT()
        let resultSuccess: Result<UIImage, StoreError> = .success(UIImage())
        
        let spotlight: Spotlight = .fixture()
        
        let banner = sut.createSpotlightBanner(
            from: spotlight,
            result: resultSuccess
        )
        
        XCTAssertEqual(spotlight.name, banner.name)
        XCTAssertEqual(spotlight.description, banner.description)
       
        switch resultSuccess {
        case .success(let success):
            XCTAssertNotNil(success)
        case .failure(let failure):
            XCTFail("Undefined behavior \(failure)")
        }
    }
    
    func test_createSpotlightBanner_resultFailure() {
        let (sut, _) = makeSUT()
        let resultFailure: Result<UIImage, StoreError> = .failure(.unknown)
        
        let spotlight: Spotlight = .fixture()
        
        let banner = sut.createSpotlightBanner(
            from: spotlight,
            result: resultFailure
        )
        
        XCTAssertEqual(spotlight.name, banner.name)
        XCTAssertEqual(spotlight.description, banner.description)
        
        if case let .failure(failure) = resultFailure {
            XCTAssertEqual(failure, .unknown)
            XCTAssertNotNil(failure)
        } else {
            XCTFail("Unexpected success")
        }
    }

}

extension SpotlightViewModelTests {
    func makeSUT() -> (SpotlightViewModel, StoreRemoteImageStub) {
        let storeRemoteImageStub = StoreRemoteImageStub()
        let sut = SpotlightViewModel(service: storeRemoteImageStub)
        
        return (sut, storeRemoteImageStub)
    }
}

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
