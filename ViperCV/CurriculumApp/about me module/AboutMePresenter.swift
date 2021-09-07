//
//  AboutMePresenter.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation

// MARK: AboutMePresenter class
final class AboutMePresenter: AboutMePresenterProtocol {
    // MARK: - Properties
    weak var view: AboutMeViewProtocol?
    var interactor: AboutMeInteractorProtocol?
    var router: AboutMeRouterProtocol?
    
    // MARK: - Methods
    func getAboutMeInfo() {
        interactor?.fetchAboutMeInfo()
    }
    
    func sendAboutMeInfo(_ info: AboutModel) {
        if let view = view {
            view.showContactInfo(info)
        }
    }
    
    func sendError(_ errorMessage: String) {
        if let view = view {
            router?.showError(errorMessage, view: view)
        }
    }
}
