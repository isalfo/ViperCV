//
//  ContactInteractorUnitTests.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 27/08/2021.
//

import XCTest
@testable import CurriculumApp
// MARK: ContactInteractorUnitTests class
final class ContactInteractorUnitTests: XCTestCase {
    // MARK: - Properties
    var sut: ContactInteractorProtocol?
    let fakePresenter = FakeContactPresenter()
    let fakeAPIDataManager = FakeContactAPIDataManager()
    
    // MARK: - Lyfecicle methods
    override func setUp() {
        super.setUp()
        sut = ContactInteractor()
        sut?.apiDataManager = fakeAPIDataManager
        sut?.presenter = fakePresenter
        
    }

    override func tearDown() {
        super.tearDown()
        sut?.apiDataManager = nil
        sut?.presenter = nil
        sut = nil
    }
    
    // MARK: - Test methods
    func testFetchContact() {
        // Given
        FakeContactAPIDataManager.dataManagerIsCalled = false
        // When
        sut?.fetchContact()
        // Then
        XCTAssertTrue(FakeContactAPIDataManager.dataManagerIsCalled)
    }
    
    func testValidateCareerButtonPushed() {
        // Given
        let selectedButton: String = "Career"
        FakeContactPresenter.validateCareerIsCalled = false
        // When
        sut?.validate(selectedButton, contact: DummyContact.dummyContact)
        // Then
        XCTAssertTrue(FakeContactPresenter.validateCareerIsCalled)
    }
    
    func testValidateAboutMeButtonPushed() {
        // Given
        let selectedButton: String = "About"
        FakeContactPresenter.validateAboutMeIsCalled = false
        // When
        sut?.validate(selectedButton, contact: DummyContact.dummyContact)
        // Then
        XCTAssertTrue(FakeContactPresenter.validateAboutMeIsCalled)
    }
    
    func testValidateAchievementsButtonPushed() {
        // Given
        let selectedButton: String = "Achievements"
        FakeContactPresenter.validateAchievementsIsCalled = false
        // When
        sut?.validate(selectedButton, contact: DummyContact.dummyContact)
        // Then
        XCTAssertTrue(FakeContactPresenter.validateAchievementsIsCalled)
    }
}
