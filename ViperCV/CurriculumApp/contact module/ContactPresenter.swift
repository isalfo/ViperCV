//
//  ContactPresenter.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import UIKit

// MARK: ContactPresenter class
final class ContactPresenter: ContactPresenterProtocol {
    // MARK: - Properties
    var router: ContactRouterProtocol?
    var interactor: ContactInteractorProtocol?
    weak var view: ContactViewProtocol?
    
    // MARK: - Methods
    func sendContact(contact: Contact) {
        view?.getViewContact(contact)
    }
    
    func getContact() {
        interactor?.fetchContact()
    }
    
    func askForView(for sender: String, with contact: Contact) {
        interactor?.validate(sender, contact: contact)
    }
    
    func sendToWorkModule() {
        if let view = view {
            router?.showCareer(fromView: view)
        }
    }
    
    func sendToAboutMeModule() {
        if let view = view {
            router?.showAboutMe(fromView: view)
        }
    }
    
    func sendToAchievementsModule() {
        if let view = view {
            router?.showAchievements(fromView: view)
        }
    }
    
    func sendError(_ errorMessage: String) {
        if let view = view {
            router?.showError(from: view, with: errorMessage)
        }
    }
}
