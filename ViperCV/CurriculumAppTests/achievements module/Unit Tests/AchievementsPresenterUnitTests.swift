//
//  AchievementsPresenterUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import XCTest
@testable import CurriculumApp

// MARK: AchievementsPresenterUnitTests class
final class AchievementsPresenterUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: AchievementsPresenterProtocol?
    let fakeView = FakeAchievementsView()
    let fakeInteractor = FakeAchievementsInteractor()
    let fakeRouter = FakeAchievementsRouter()
    
    // MARK: - Lifecycle methods
    override func setUpWithError() throws {
        sut = AchievementsPresenter()
        sut?.view = fakeView
        sut?.interactor = fakeInteractor
        sut?.router = fakeRouter
    }

    override func tearDownWithError() throws {
        sut?.view = nil
        sut?.interactor = nil
        sut?.router = nil
        sut = nil
    }
    
    // MARK: - Test methods
    func testGetAchievementsCallsInteractor() {
        // Given
        FakeAchievementsInteractor.fetchAchievementsIsCalled = false
        // When
        sut?.getAchievements()
        // Then
        XCTAssertTrue(FakeAchievementsInteractor.fetchAchievementsIsCalled)
    }
    
    func testSendAchievementsCallsView() {
        // Given
        FakeAchievementsView.showAchievementsIsCalled = false
        // When
        sut?.sendAchievements(DummyAchievements.dummyAchievements)
        // Then
        XCTAssertTrue(FakeAchievementsView.showAchievementsIsCalled)
    }
    
    func testSendErrorCallsRouter() {
        // Given
        FakeAchievementsRouter.showErrorIsCalled = false
        let errorMessage = "Error_Message_Test"
        // When
        sut?.sendError(errorMessage)
        // Then
        XCTAssertTrue(FakeAchievementsRouter.showErrorIsCalled)
    }
    
    func testSendErrorCallsRouterWithMessage() {
        // Given
        let errorMessage = "Error_Message_Test"
        // When
        sut?.sendError(errorMessage)
        // Then
        XCTAssertEqual(errorMessage, FakeAchievementsRouter.errorMessage)
    }
}
