//
//  CareerInteractorUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import XCTest
@testable import CurriculumApp

// MARK: CareerInteractorUnitTests class
final class CareerInteractorUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: CareerInteractorProtocol?
    let fakeCareerAPIDataManager = FakeCareerAPIDataManager()
    
    // MARK: - Lifecycle methods
    override func setUpWithError() throws {
        sut = CareerInteractor()
        sut?.apiDataManager = fakeCareerAPIDataManager
    }

    override func tearDownWithError() throws {
        sut?.apiDataManager = nil
        sut = nil
    }
    
    // MARK: - Test methods
    func testFetchJobsCallsAPIDataManager() {
        // Given
        FakeCareerAPIDataManager.fetchWorkIsCalled = false
        // When
        sut?.fetchJobs()
        // Then
        XCTAssertTrue(FakeCareerAPIDataManager.fetchWorkIsCalled)
    }
}
