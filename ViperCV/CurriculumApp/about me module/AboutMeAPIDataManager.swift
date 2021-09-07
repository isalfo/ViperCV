//
//  AboutMeAPIDataManager.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 01/09/2021.
//

import Foundation

// MARK: ContactAPIDataManager class
final class AboutMeAPIDataManager: AboutMeAPIDataManagerProtocol {
    // MARK: - Properties
    var network: NetworkingProtocol = Networking()
    
    // MARK: - Methods
    func fetch(_ completion: @escaping (Result<AboutModel, Error>) -> Void) {
        network.execute(Endpoint.contact, completion: completion)
    }
}
