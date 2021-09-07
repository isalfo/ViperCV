//
//  FakeContactInteractor.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 02/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeContactInteractor class
final class FakeContactInteractor: ContactInteractorProtocol {
    // MARK: - Properties
    var apiDataManager: CurriculumAPIDataManagerProtocol? = FakeContactAPIDataManager()
    var presenter: ContactPresenterProtocol? = FakeContactPresenter()
    static var fetchContactIsCalled: Bool!
    static var aboutSelected: Bool!
    static var careerSelected: Bool!
    static var achievementsSelected: Bool!
    
    // MARK: - Methods
    func fetchContact() {
        FakeContactInteractor.fetchContactIsCalled = true
    }
    
    func validate(_ selectedButton: String, contact: Contact) {
        switch selectedButton {
        case "About":
            FakeContactInteractor.aboutSelected = true
        case "Career":
            FakeContactInteractor.careerSelected = true
        case "Achievements":
            FakeContactInteractor.achievementsSelected = true
        default: break
        }
    }
}
