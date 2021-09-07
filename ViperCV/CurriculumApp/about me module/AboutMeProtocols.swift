//
//  Protocols.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import UIKit

// MARK: AboutMe protocols
protocol AboutMeViewProtocol: UIViewController {
    var presenter: AboutMePresenterProtocol? { get set }
    func showContactInfo(_ info: AboutModel)
}

protocol AboutMeInteractorProtocol: AnyObject {
    var presenter: AboutMePresenterProtocol? { get set }
    var apiDataManager: AboutMeAPIDataManagerProtocol? { get set }
    func fetchAboutMeInfo()
}

protocol AboutMePresenterProtocol: AnyObject {
    var interactor: AboutMeInteractorProtocol? { get set }
    var view: AboutMeViewProtocol? { get set }
    var router: AboutMeRouterProtocol? { get set }
    func getAboutMeInfo()
    func sendAboutMeInfo(_ info: AboutModel)
    func sendError(_ errorMessage: String)
}

protocol AboutMeRouterProtocol {
    func showError(_ message: String, view: AboutMeViewProtocol)
}

protocol AboutMeAPIDataManagerProtocol {
    var network: NetworkingProtocol { get set }
    func fetch(_ completion: @escaping (Result<AboutModel, Error>) -> Void)
}
