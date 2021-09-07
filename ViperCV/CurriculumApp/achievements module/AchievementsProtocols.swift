//
//  AchievementsProtocols.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import UIKit

// MARK: Achievements protocols
protocol AchievementsViewProtocol: UIViewController {
    var presenter: AchievementsPresenterProtocol? { get set }
    func showAchievements(_ achievements: String)
}

protocol AchievementsInteractorProtocol: AnyObject {
    var presenter: AchievementsPresenterProtocol? { get set }
    var apiDataManager: AchievementsAPIDataManagerProtocol? { get set }
    func fetchAchievements()
}

protocol AchievementsPresenterProtocol: AnyObject {
    var view: AchievementsViewProtocol? { get set }
    var interactor: AchievementsInteractorProtocol? { get set }
    var router: AchievementsRouterProtocol? { get set }
    func getAchievements()
    func sendAchievements(_ achievements: [String])
    func sendError(_ errorMessage: String)
}

protocol AchievementsRouterProtocol {
    func showError(_ message: String, view: AchievementsViewProtocol)
}

protocol AchievementsAPIDataManagerProtocol {
    var network: NetworkingProtocol { get set }
    func fetch(_ completion: @escaping (Result<AchievementsModel, Error>) -> Void)
}
