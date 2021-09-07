//
//  CareerInteractor.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation

// MARK: CareerInteractor class
final class CareerInteractor: CareerInteractorProtocol {
    // MARK: - Properties
    weak var presenter: CareerPresenterProtocol?
    var apiDataManager: CareerAPIDataManagerProtocol?
    
    // MARK: - Methods
    func fetchJobs() {
        apiDataManager?.fetchWork() { [weak self] response in
            guard let self = self else {
                return
            }
            
            switch response {
            case .success(let result):
                self.presenter?.sendCareer(result.work)
            case .failure(let error):
                var errorMessage: String?
                switch error as? NetworkErrors {
                    case .parsingError:
                        errorMessage = NSLocalizedString("Interactor_ParsingError_ErrorMessage_Text", comment: "")
                    case .urlError:
                        errorMessage = NSLocalizedString("Interactor_URLError_ErrorMessage_Text", comment: "")
                    default:
                        errorMessage = NSLocalizedString("Interactor_DefaultError_ErrorMessage_Text", comment: "")
                }
                self.presenter?.sendError(errorMessage ?? NSLocalizedString("EmptyString", comment: ""))
            }
        }
    }
}
