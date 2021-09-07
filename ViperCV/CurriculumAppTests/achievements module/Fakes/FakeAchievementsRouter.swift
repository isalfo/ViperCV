//
//  FakeAchievementsRouter.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAchievementsRouter class
final class FakeAchievementsRouter: AchievementsRouterProtocol {
    // MARK: - Properties
    static var showErrorIsCalled: Bool!
    static var errorMessage: String!
    
    // MARK: - Methods
    func showError(_ message: String, view: AchievementsViewProtocol) {
        FakeAchievementsRouter.showErrorIsCalled = true
        FakeAchievementsRouter.errorMessage = message
    }
}
