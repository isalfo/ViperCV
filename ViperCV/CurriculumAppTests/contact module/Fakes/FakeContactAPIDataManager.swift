//
//  FakeAPIDataManager.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 27/08/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeContactAPIDataManager class
final class FakeContactAPIDataManager: CurriculumAPIDataManagerProtocol {
    // MARK: - Properties
    static var dataManagerIsCalled: Bool!
    var network: NetworkingProtocol = FakeNetworkLayer()
    
    // MARK: - Methods
    func fetch(_ completion: @escaping (Result<Contact, Error>) -> Void) {
        FakeContactAPIDataManager.dataManagerIsCalled = true
        network.execute(Endpoint.contact, completion: completion)
    }
}
