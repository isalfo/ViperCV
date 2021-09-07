//
//  FakeAboutMeInteractor.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAboutMeInteractor class
final class FakeAboutMeInteractor: AboutMeInteractorProtocol {
    // MARK: - Properties
    var presenter: AboutMePresenterProtocol?
    var apiDataManager: AboutMeAPIDataManagerProtocol?
    static var fetchABoutMeInfoIsCalled: Bool!
    
    // MARK: - Methods
    func fetchAboutMeInfo() {
        FakeAboutMeInteractor.fetchABoutMeInfoIsCalled = true
    }
}
