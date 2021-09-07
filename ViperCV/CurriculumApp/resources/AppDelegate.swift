//
//  AppDelegate.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view: ContactView = mainStoryBoard.instantiateViewController(identifier: "Contact View") as? ContactView else { return true }
        let interactor: ContactInteractorProtocol = ContactInteractor()
        let presenter: ContactPresenterProtocol = ContactPresenter()
        let apiDataManager: CurriculumAPIDataManagerProtocol = ContactAPIDataManager()
        let router: ContactRouterProtocol = ContactRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        
        window? = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: view)
        return true
    }
}
