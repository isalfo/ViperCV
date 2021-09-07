//
//  ContactPresenterUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 02/09/2021.
//

import XCTest
@testable import CurriculumApp

// MARK: ContactPresenterUnitTests class
final class ContactPresenterUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: ContactPresenterProtocol?
    let fakeView = FakeContactView()
    let fakeRouter = FakeContactRouter()
    let fakeInteractor = FakeContactInteractor()
    
    // MARK: - Lifecycle methods
    override func setUpWithError() throws {
        sut = ContactPresenter()
        sut?.interactor = fakeInteractor
        sut?.router = fakeRouter
        sut?.view = fakeView
    }

    override func tearDownWithError() throws {
        sut?.interactor = nil
        sut?.router = nil
        sut?.view = nil
        sut = nil
    }
    
    // MARK: - Test methods
    func testSendContactCallsView() {
        // Given
        FakeContactView.getViewContactIsCalled = false
        // When
        sut?.sendContact(contact: DummyContact.dummyContact)
        // Then
        XCTAssertTrue(FakeContactView.getViewContactIsCalled)
    }
    
    func testGetContactCallsInteractor() {
        // Given
        FakeContactInteractor.fetchContactIsCalled = false
        // When
        sut?.getContact()
        // Then
        XCTAssertTrue(FakeContactInteractor.fetchContactIsCalled)
    }
    
    func testAskForViewCaseCareerCallsInteractor() {
        // Given
        let selectedView: String = "Career"
        FakeContactInteractor.careerSelected = false
        // When
        sut?.askForView(for: selectedView, with: DummyContact.dummyContact)
        // Then
        XCTAssertTrue(FakeContactInteractor.careerSelected)
    }
    
    func testAskForViewCaseAboutCallsInteractor() {
        // Given
        let selectedView: String = "About"
        FakeContactInteractor.careerSelected = false
        // When
        sut?.askForView(for: selectedView, with: DummyContact.dummyContact)
        // Then
        XCTAssertTrue(FakeContactInteractor.aboutSelected)
    }
    
    func testAskForViewCaseAchievementsCallsInteractor() {
        // Given
        let selectedView: String = "Achievements"
        FakeContactInteractor.careerSelected = false
        // When
        sut?.askForView(for: selectedView, with: DummyContact.dummyContact)
        // Then
        XCTAssertTrue(FakeContactInteractor.achievementsSelected)
    }
    
    func testSendToWorkModuleCallsRouter() {
        // Given
        FakeContactRouter.showCareerIsCalled = false
        // When
        sut?.sendToWorkModule()
        // Then
        XCTAssertTrue(FakeContactRouter.showCareerIsCalled)
    }
    
    func testSendToAboutMeModuleCallsRouter() {
        // Given
        FakeContactRouter.showAboutMeIsCalled = false
        // When
        sut?.sendToAboutMeModule()
        // Then
        XCTAssertTrue(FakeContactRouter.showAboutMeIsCalled)
    }
    
    func testSendToAchievementsModuleCallsRouter() {
        // Given
        FakeContactRouter.showAchievementsIsCalled = false
        // When
        sut?.sendToAchievementsModule()
        // Then
        XCTAssertTrue(FakeContactRouter.showAchievementsIsCalled)
    }
    
    func testSendErrorCallsRouter() {
        // Given
        FakeContactRouter.sendErrorIsCalled = false
        // When
        sut?.sendError("")
        // Then
        XCTAssertTrue(FakeContactRouter.sendErrorIsCalled)
    }
    
    func testSendErrorCallsRouterWithMessageString() {
        // Given
        let errorMessage = "Error_Message_Test"
        // When
        sut?.sendError(errorMessage)
        // Then
        XCTAssertEqual(errorMessage, FakeContactRouter.errorMessage)
    }
}
