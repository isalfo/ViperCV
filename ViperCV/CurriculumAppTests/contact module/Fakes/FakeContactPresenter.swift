//
//  FakePresenter.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 02/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakePresenter class
final class FakeContactPresenter: ContactPresenterProtocol {
    // MARK: - Properties
    var interactor: ContactInteractorProtocol?
    var router: ContactRouterProtocol?
    var view: ContactViewProtocol?
    static var validateCareerIsCalled: Bool!
    static var validateAboutMeIsCalled: Bool!
    static var validateAchievementsIsCalled: Bool!
    static var getContactIsCalled: Bool!
    
    // MARK: - Methods
    func sendContact(contact: Contact) { }
    
    func getContact() {
        FakeContactPresenter.getContactIsCalled = true
    }
    
    func askForView(for sender: String, with contact: Contact) { }
    
    func sendToWorkModule() {
        FakeContactPresenter.validateCareerIsCalled = true
    }
    
    func sendToAboutMeModule() {
        FakeContactPresenter.validateAboutMeIsCalled = true
    }
    
    func sendToAchievementsModule() {
        FakeContactPresenter.validateAchievementsIsCalled = true
    }
    
    func sendError(_ errorMessage: String) { }
    
}
