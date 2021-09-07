//
//  CarrerProtocols.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation
import UIKit

// MARK: Career protocols
protocol CareerViewProtocol: UIViewController {
    var presenter: CareerPresenterProtocol? { get set }
    func showJobs(_ jobs: [Work])
}

protocol CareerInteractorProtocol: AnyObject {
    var presenter: CareerPresenterProtocol? { get set }
    var apiDataManager: CareerAPIDataManagerProtocol? { get set }
    func fetchJobs()
}

protocol CareerPresenterProtocol: AnyObject {
    var view: CareerViewProtocol? { get set }
    var router: CareerRouterProtocol? { get set }
    var interactor: CareerInteractorProtocol? { get set }
    var companies: [String] { get set }
    func getJobs()
    func companyDetail(_ company: String)
    func sendCareer(_ jobs: [Work])
    func sendError(_ errorMessage: String)
}

protocol CareerRouterProtocol {
    func sendAlert(from view: CareerViewProtocol, title: String)
    func showError(_ message: String, view: CareerViewProtocol)
}

protocol CareerAPIDataManagerProtocol {
    var network: NetworkingProtocol { get set }
    func fetchWork(_ completion: @escaping (Result<CareerModel, Error>) -> Void)
}
