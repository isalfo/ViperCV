//
//  AchievementsInteractorUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import XCTest
@testable import CurriculumApp

// MARK: AchievementsInteractorUnitTests class
final class AchievementsInteractorUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: AchievementsInteractorProtocol?
    let fakePresenter = FakeAchievementsPresenter()
    let fakeAPIDataManager = FakeAchievementsAPIDataManager()
    
    // MARK: - Lifecycle methods
    override func setUpWithError() throws {
        sut = AchievementsInteractor()
        sut?.presenter = fakePresenter
        sut?.apiDataManager = fakeAPIDataManager
    }

    override func tearDownWithError() throws {
        sut?.presenter = nil
        sut?.apiDataManager = nil
        sut = nil
    }
    
    // MARK: - Test methods
    func testFetchAchievementsCallsAPIDataManager() {
        // Given
        FakeAchievementsAPIDataManager.fetchIsCalled = false
        // When
        sut?.fetchAchievements()
        // Then
        XCTAssertTrue(FakeAchievementsAPIDataManager.fetchIsCalled)
    }
}
