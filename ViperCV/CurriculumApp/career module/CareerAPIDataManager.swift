//
//  CareerAPIDataManager.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 01/09/2021.
//

import Foundation

// MARK: CareerAPIDataManager class
final class CareerAPIDataManager: CareerAPIDataManagerProtocol {
    // MARK: - Properties
    var network: NetworkingProtocol = Networking()
    
    // MARK: - Methods
    func fetchWork(_ completion: @escaping (Result<CareerModel, Error>) -> Void) {
        network.execute(Endpoint.contact, completion: completion)
    }
}
