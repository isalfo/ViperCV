//
//  FakeAboutMeRouter.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAboutMeRouter class
final class FakeAboutMeRouter: AboutMeRouterProtocol {
    // MARK: - Properties
    static var showErrorIsCalled: Bool!
    static var errorMessage: String!
    
    // MARK: - Methods
    func showError(_ message: String, view: AboutMeViewProtocol) {
        FakeAboutMeRouter.showErrorIsCalled = true
        FakeAboutMeRouter.errorMessage = message
    }
}
