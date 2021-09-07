//
//  FakeAchievementsPresenter.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAchievementsPresenter class
final class FakeAchievementsPresenter: AchievementsPresenterProtocol {
    // MARK: - Properties
    var view: AchievementsViewProtocol?
    var interactor: AchievementsInteractorProtocol?
    var router: AchievementsRouterProtocol?
    static var getAchievementsIsCalled: Bool!
    static var sendAchievementsIsCalled: Bool!
    static var sendErrorIsCalled: Bool!
    
    // MARK: - Methods
    func getAchievements() {
        FakeAchievementsPresenter.getAchievementsIsCalled = true
    }
    
    func sendAchievements(_ achievements: [String]) {
        FakeAchievementsPresenter.sendAchievementsIsCalled = true
    }
    
    func sendError(_ errorMessage: String) {
        FakeAchievementsPresenter.sendErrorIsCalled = true
    }
}
