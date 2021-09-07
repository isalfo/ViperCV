//
//  FakeCareerInteractor.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeCareerInteractor class
final class FakeCareerInteractor: CareerInteractorProtocol {
    // MARK: - Properties
    var presenter: CareerPresenterProtocol?
    var apiDataManager: CareerAPIDataManagerProtocol?
    static var fetchJobsIsCalled: Bool!
    
    // MARK: - Methods
    func fetchJobs() {
        FakeCareerInteractor.fetchJobsIsCalled = true
    }
}
