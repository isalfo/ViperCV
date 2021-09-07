//
//  ContactInteractor.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import Foundation

// MARK: ContactInteractor class
final class ContactInteractor: ContactInteractorProtocol {
    
    // MARK: - Properties
    var apiDataManager: CurriculumAPIDataManagerProtocol?
    weak var presenter: ContactPresenterProtocol?
    
    // MARK: - Methods
    func fetchContact() {
        apiDataManager?.fetch() { [weak self] response in
            guard let self = self else {
                return
            }
            
            switch response {
            case .success(let result):
                self.presenter?.sendContact(contact: result)
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
    
    func validate(_ selectedButton: String, contact: Contact) {
        let contactFeatures: ContactFeatures = ContactFeatures.init(rawValue: selectedButton) ?? .notFound
        
        switch contactFeatures {
        case .career:
            presenter?.sendToWorkModule()
        case .about:
            presenter?.sendToAboutMeModule()
        case .achievements:
            presenter?.sendToAchievementsModule()
        case .notFound:
            presenter?.sendError(NSLocalizedString("EmptyString", comment: ""))
        }
    }
}
