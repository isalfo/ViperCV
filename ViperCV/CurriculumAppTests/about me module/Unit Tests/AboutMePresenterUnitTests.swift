//
//  AboutMePresenterUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import XCTest
@testable import CurriculumApp

// MARK: AboutMePresenterUnitTests class
final class AboutMePresenterUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: AboutMePresenterProtocol?
    let fakeView = FakeAboutMeView()
    let fakeInteractor = FakeAboutMeInteractor()
    let fakeRouter = FakeAboutMeRouter()
    
    // MARK: - Lifecycle methods
    override func setUpWithError() throws {
        sut = AboutMePresenter()
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
    func testgetAboutMeInfoCalssInteractor() {
        // Given
        FakeAboutMeInteractor.fetchABoutMeInfoIsCalled = false
        // When
        sut?.getAboutMeInfo()
        // Then
        XCTAssertTrue(FakeAboutMeInteractor.fetchABoutMeInfoIsCalled)
    }
    
    func testSendAboutMeInfoCallsView() {
        // Given
        FakeAboutMeView.showContactInfoIsCalled = true
        // When
        sut?.sendAboutMeInfo(DummyAboutMe.dummyAboutMe)
        // Then
        XCTAssertTrue(FakeAboutMeView.showContactInfoIsCalled)
    }
    
    func testSendErrorCallsRouter() {
        // Given
        FakeAboutMeRouter.showErrorIsCalled = true
        let errorMessage = "Error_Message_Test"
        // When
        sut?.sendError(errorMessage)
        // Then
        XCTAssertTrue(FakeAboutMeRouter.showErrorIsCalled)
    }
    
    func testSendErrorCallsRouterWithMessage() {
        // Given
        let errorMessage = "Error_Message_Test"
        // When
        sut?.sendError(errorMessage)
        // Then
        XCTAssertEqual(errorMessage, FakeAboutMeRouter.errorMessage)
    }
}
