//
//  AboutMeInteractorUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import XCTest
@testable import CurriculumApp

// MARK: AboutMeInteractorUnitTests class
final class AboutMeInteractorUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: AboutMeInteractorProtocol?
    let fakePresenter = FakeAboutMePresenter()
    let fakeAPIDataManager = FakeAboutMeAPIDataManager()
    
    // MARK: - Lifecycle methods
    override func setUpWithError() throws {
        sut = AboutMeInteractor()
        sut?.presenter = fakePresenter
        sut?.apiDataManager = fakeAPIDataManager
    }

    override func tearDownWithError() throws {
        sut?.presenter = nil
        sut?.apiDataManager = nil
        sut = nil
    }
    
    // MARK: - Test methods
    func testFetchAboutMeInfoCallsAPIDataManager() {
        // Given
        FakeAboutMeAPIDataManager.fetchIsCalled = false
        // When
        sut?.fetchAboutMeInfo()
        // Then
        XCTAssertTrue(FakeAboutMeAPIDataManager.fetchIsCalled)
    }
}
