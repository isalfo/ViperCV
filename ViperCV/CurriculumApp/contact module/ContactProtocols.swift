//
//  ContactProtocols.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import Foundation
import UIKit

// MARK: - Contact protocols
protocol ContactViewProtocol: UIViewController {
    var presenter: ContactPresenterProtocol? { get set }
    func getViewContact(_ contact: Contact)
    func goToPresenter(for sender: String, with contact: Contact)
    func hideLabels()
    func createErrorLabels()
}

protocol ContactInteractorProtocol: AnyObject {
    var apiDataManager: CurriculumAPIDataManagerProtocol? { get set }
    var presenter: ContactPresenterProtocol? { get set }
    func fetchContact()
    func validate(_ selectedButton: String, contact: Contact)
}

protocol ContactPresenterProtocol: AnyObject {
    var interactor: ContactInteractorProtocol? { get set }
    var router: ContactRouterProtocol? { get set }
    var view: ContactViewProtocol? { get set }
    func sendContact(contact: Contact)
    func getContact()
    func askForView(for sender: String, with contact: Contact)
    func sendToWorkModule()
    func sendToAboutMeModule()
    func sendToAchievementsModule()
    func sendError(_ errorMessage: String)
}

protocol ContactRouterProtocol {
    func showCareer(fromView: ContactViewProtocol)
    func showAboutMe(fromView: ContactViewProtocol)
    func showAchievements(fromView: ContactViewProtocol)
    func showError(from view: ContactViewProtocol, with message: String)
}

protocol CurriculumAPIDataManagerProtocol {
    var network: NetworkingProtocol { get set }
    func fetch(_ completion: @escaping (Result<Contact, Error>) -> Void)
}
