//
//  AchievementsAPIDataManager.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 01/09/2021.
//

import Foundation

// MARK: ContactAPIDataManager class
final class AchievementsAPIDataManager: AchievementsAPIDataManagerProtocol {
    // MARK: - Properties
    var network: NetworkingProtocol = Networking()
    
    // MARK: - Methods
    func fetch(_ completion: @escaping (Result<AchievementsModel, Error>) -> Void) {
        network.execute(Endpoint.contact, completion: completion)
    }
}
