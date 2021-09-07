//
//  FakeContactRouter.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 02/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeContactRouter class
final class FakeContactRouter: ContactRouterProtocol {
    // MARK: - Properties
    static var showCareerIsCalled: Bool!
    static var showAboutMeIsCalled: Bool!
    static var showAchievementsIsCalled: Bool!
    static var sendErrorIsCalled: Bool!
    static var errorMessage: String!
    
    // MARK: - Methods
    func showCareer(fromView: ContactViewProtocol) {
        FakeContactRouter.showCareerIsCalled = true
    }
    
    func showAboutMe(fromView: ContactViewProtocol) {
        FakeContactRouter.showAboutMeIsCalled = true
    }
    
    func showAchievements(fromView: ContactViewProtocol) {
        FakeContactRouter.showAchievementsIsCalled = true
    }
    
    func showError(from view: ContactViewProtocol, with message: String) {
        FakeContactRouter.sendErrorIsCalled = true
        FakeContactRouter.errorMessage = message
    }
}
