//
//  CareerPresenter.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation

// MARK: CareerPresenter class
final class CareerPresenter: CareerPresenterProtocol {
    
    // MARK: - Properties
    weak var view: CareerViewProtocol?
    var router: CareerRouterProtocol?
    var interactor: CareerInteractorProtocol?
    var companies: [String] = []
    
    // MARK: - Methods
    func getJobs() {
        interactor?.fetchJobs()
    }
    
    func companyDetail(_ company: String) {
        if let view = view {
            router?.sendAlert(from: view, title: company)
        }
    }
    
    func sendCareer(_ jobs: [Work]) {
        for item in jobs {
            companies.append(item.company)
        }
        view?.showJobs(jobs)
    }
    
    func sendError(_ errorMessage: String) {
        if let view = view {
            router?.showError(errorMessage, view: view)
        }
    }
}
