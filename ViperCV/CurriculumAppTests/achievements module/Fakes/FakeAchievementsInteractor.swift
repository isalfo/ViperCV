//
//  FakeAchievementsInteractor.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAchievementsInteractor class
final class FakeAchievementsInteractor: AchievementsInteractorProtocol {
    // MARK: - Properties
    var presenter: AchievementsPresenterProtocol?
    var apiDataManager: AchievementsAPIDataManagerProtocol?
    static var fetchAchievementsIsCalled: Bool!
    
    // MARK: - Methods
    func fetchAchievements() {
        FakeAchievementsInteractor.fetchAchievementsIsCalled = true
    }
}
