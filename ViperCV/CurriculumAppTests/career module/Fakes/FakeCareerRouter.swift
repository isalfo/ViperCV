//
//  FakeCareerRouter.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeCareerRouter class
final class FakeCareerRouter: CareerRouterProtocol {
    // MARK: - Properties
    static var sendAlertIsCalled: Bool!
    static var showErrorIsCalled: Bool!
    static var alertTitle: String!
    static var errorMessage: String!
    
    // MARK: - Methods
    func sendAlert(from view: CareerViewProtocol, title: String) {
        FakeCareerRouter.sendAlertIsCalled = true
        FakeCareerRouter.alertTitle = title
    }
    
    func showError(_ message: String, view: CareerViewProtocol) {
        FakeCareerRouter.showErrorIsCalled = true
        FakeCareerRouter.errorMessage = message
    }
}
