//
//  FakeCareerAPIDataManager.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeCareerAPIDataManager class
final class FakeCareerAPIDataManager: CareerAPIDataManagerProtocol {
    // MARK: - Properties
    var network: NetworkingProtocol = FakeNetworkLayer()
    static var fetchWorkIsCalled: Bool!
    
    // MARK: - Methods
    func fetchWork(_ completion: @escaping (Result<CareerModel, Error>) -> Void) {
        FakeCareerAPIDataManager.fetchWorkIsCalled = true
    }
}
