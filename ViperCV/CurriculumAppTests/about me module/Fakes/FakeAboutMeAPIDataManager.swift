//
//  FakeAboutMeAPIDataManager.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAboutMeAPIDataManager class
final class FakeAboutMeAPIDataManager: AboutMeAPIDataManagerProtocol {
    // MARK: - Properties
    var network: NetworkingProtocol = FakeNetworkLayer()
    static var fetchIsCalled: Bool!
    
    // MARK: - Methods
    func fetch(_ completion: @escaping (Result<AboutModel, Error>) -> Void) {
        FakeAboutMeAPIDataManager.fetchIsCalled = true
    }
}
