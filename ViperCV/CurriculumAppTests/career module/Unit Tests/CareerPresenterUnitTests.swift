//
//  CareerPresenterUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import XCTest
@testable import CurriculumApp

// MARK: CareerPresenterUnitTests class
final class CareerPresenterUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: CareerPresenterProtocol?
    let fakeInteractor = FakeCareerInteractor()
    let fakeRouter = FakeCareerRouter()
    let fakeView = FakeCareerView()
    
    // MARK: - Lifecycle methods
    override func setUpWithError() throws {
        sut = CareerPresenter()
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
    func testGetJobsCallsInteractor() {
        // Given
        FakeCareerInteractor.fetchJobsIsCalled = false
        // When
        sut?.getJobs()
        // Then
        XCTAssertTrue(FakeCareerInteractor.fetchJobsIsCalled)
    }
    
    func testCompanyDetailCallsRouter() {
        // Given
        FakeCareerRouter.sendAlertIsCalled = false
        let company = "Test_Company"
        // When
        sut?.companyDetail(company)
        // Then
        XCTAssertTrue(FakeCareerRouter.sendAlertIsCalled)
    }
    
    func testCompanyDetailCallsRouterWithTitleString() {
        // Given
        let alertTitle = "Alert_Title_Test"
        // When
        sut?.companyDetail(alertTitle)
        // Then
        XCTAssertEqual(alertTitle, FakeCareerRouter.alertTitle)
    }
    
    func testSendCareerCallsView() {
        // Given
        FakeCareerView.showJobsIsCalled = false
        // When
        sut?.sendCareer([DummyWork.dummyWork1, DummyWork.dummyWork2, DummyWork.dummyWork3])
        // Then
        XCTAssertTrue(FakeCareerView.showJobsIsCalled)
    }
    
    func testSendErrorCallsRouter() {
        // Given
        FakeCareerRouter.showErrorIsCalled = false
        let errorMessage = "Error_Message_Test"
        // When
        sut?.sendError(errorMessage)
        // Then
        XCTAssertTrue(FakeCareerRouter.showErrorIsCalled)
        
    }
    
    func testSendErrorCallsRouterWithMessage() {
        // Given
        FakeCareerRouter.showErrorIsCalled = false
        let errorMessage = "Error_Message_Test"
        // When
        sut?.sendError(errorMessage)
        // Then
        XCTAssertEqual(errorMessage, FakeCareerRouter.errorMessage)
        
    }
}
