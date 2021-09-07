//
//  ContactRouter.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation
import UIKit

// MARK: ContactRouter class
final class ContactRouter: ContactRouterProtocol {
    // MARK: - Methods
    func showCareer(fromView: ContactViewProtocol) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: NSLocalizedString("ContactRouter_ShowCareer_StoryBoard_Name_Text", comment: ""), bundle: nil)
        
        guard let view: CareerView = mainStoryBoard.instantiateViewController(identifier: NSLocalizedString("ContactRouter_ShowCareer_StoryBoard_ViewController_Identifier_Text", comment: "")) as? CareerView else {
            preconditionFailure(NSLocalizedString("ContactRouter_ShowCareer_StoryBoard_ViewController_Failure_Text", comment: ""))
        }
        
        let interactor: CareerInteractorProtocol = CareerInteractor()
        let router: CareerRouterProtocol = CareerRouter()
        let presenter: CareerPresenterProtocol = CareerPresenter()
        let apiDataManager: CareerAPIDataManagerProtocol = CareerAPIDataManager()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.apiDataManager = apiDataManager
        interactor.presenter = presenter
        fromView.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func showAboutMe(fromView: ContactViewProtocol) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: NSLocalizedString("ContactRouter_ShowAboutMe_StoryBoard_Name_Text", comment: ""), bundle: nil)
        
        guard let view: AboutMeView = mainStoryBoard.instantiateViewController(identifier: NSLocalizedString("ContactRouter_ShowAboutMe_StoryBoard_ViewController_Identifier_Text", comment: "")) as? AboutMeView else {
            preconditionFailure(NSLocalizedString("ContactRouter_ShowAboutMe_StoryBoard_ViewController_Failure_Text", comment: ""))
        }
        
        let interactor: AboutMeInteractorProtocol = AboutMeInteractor()
        let router: AboutMeRouterProtocol = AboutMeRouter()
        let presenter: AboutMePresenterProtocol = AboutMePresenter()
        let apiDataManager: AboutMeAPIDataManagerProtocol = AboutMeAPIDataManager()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        fromView.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func showAchievements(fromView: ContactViewProtocol) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: NSLocalizedString("ContactRouter_ShowAchievements_StoryBoard_Name_Text", comment: ""), bundle: nil)
        
        guard let view: AchievementsView = mainStoryBoard.instantiateViewController(identifier: NSLocalizedString("ContactRouter_ShowAchievements_StoryBoard_ViewController_Identifier_Text", comment: "")) as? AchievementsView else {
            preconditionFailure(NSLocalizedString("ContactRouter_ShowAchievements_StoryBoard_ViewController_Failure_Text", comment:""))
        }
        
        let interactor: AchievementsInteractorProtocol = AchievementsInteractor()
        let router: AchievementsRouterProtocol = AchievementsRouter()
        let presenter: AchievementsPresenterProtocol = AchievementsPresenter()
        let apiDataManager: AchievementsAPIDataManagerProtocol = AchievementsAPIDataManager()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        fromView.navigationController?.pushViewController(view, animated: true)
    }
    
    func showError(from view: ContactViewProtocol, with message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("ContactRouter_ShowError_Alert_Title_Text", comment: ""), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("ContactRouter_ShowError_AlertAction_Title_Text", comment: ""), style: .default, handler: nil))
            view.hideLabels()
            view.createErrorLabels()
            view.present(alert, animated: true, completion: nil)
        }
    }
}
