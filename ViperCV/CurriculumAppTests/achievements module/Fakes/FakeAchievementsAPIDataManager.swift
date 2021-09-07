//
//  FakeAchievementsAPIDataManager.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAchievementsAPIDataManager
final class FakeAchievementsAPIDataManager: AchievementsAPIDataManagerProtocol {
    // MARK: - Properties
    var network: NetworkingProtocol = FakeNetworkLayer ()
    static var fetchIsCalled: Bool!
    
    // MARK: - Methods
    func fetch(_ completion: @escaping (Result<AchievementsModel, Error>) -> Void) {
        FakeAchievementsAPIDataManager.fetchIsCalled = true
    }
}
