//
//  AchievementsPresenter.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation

// MARK: - AchievementsPresenter class
final class AchievementsPresenter: AchievementsPresenterProtocol {
    
    // MARK: - Properties
    weak var view: AchievementsViewProtocol?
    var interactor: AchievementsInteractorProtocol?
    var router: AchievementsRouterProtocol?
    
    // MARK: - Methods
    func getAchievements() {
        interactor?.fetchAchievements()
    }
    
    func sendAchievements(_ achievements: [String]) {
        let joinedAchievements = achievements.joined(separator: ". \n")
        if let view = view {
            view.showAchievements(joinedAchievements)
        }
    }
    
    func sendError(_ errorMessage: String) {
        if let view = view {
            router?.showError(errorMessage, view: view)
        }
    }
}
