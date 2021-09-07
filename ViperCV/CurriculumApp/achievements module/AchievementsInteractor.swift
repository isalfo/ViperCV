//
//  AchievementsInteractor.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation

// MARK: AchievementsInteractor class
final class AchievementsInteractor: AchievementsInteractorProtocol {
    // MARK: - Properties
    weak var presenter: AchievementsPresenterProtocol?
    var apiDataManager: AchievementsAPIDataManagerProtocol?
    
    // MARK: - Methods
    func fetchAchievements() {
        apiDataManager?.fetch() { [weak self] response in
            guard let self = self else {
                return
            }
            
            switch response {
            case .success(let result):
                self.presenter?.sendAchievements(result.achievements)
            case .failure(let error):
                var errorMessage: String?
                switch error as? NetworkErrors {
                case .parsingError:
                    // TODO: Change localizable strings key for a more reusable one
                    errorMessage = NSLocalizedString("ContactInteractor_ParsingError_ErrorMessage_Text", comment: "")
                case .urlError:
                    errorMessage = NSLocalizedString("ContactInteractor_URLError_ErrorMessage_Text", comment: "")
                default:
                    errorMessage = NSLocalizedString("ContactInteractor_DefaultError_ErrorMessage_Text", comment: "")
                }
                self.presenter?.sendError(errorMessage ?? NSLocalizedString("EmptyString", comment: ""))
            }
        }
    }
}
