//
//  AboutMeInteractor.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation

// MARK: AboutMeInteractor class
final class AboutMeInteractor: AboutMeInteractorProtocol {
    // MARK: - Properties
    weak var presenter: AboutMePresenterProtocol?
    var apiDataManager: AboutMeAPIDataManagerProtocol?
    
    // MARK: - Methods
    func fetchAboutMeInfo() {
        apiDataManager?.fetch() { [weak self] response in
            guard let self = self else {
                return
            }
            
            switch response {
            case .success(let result):
                self.presenter?.sendAboutMeInfo(result)
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
