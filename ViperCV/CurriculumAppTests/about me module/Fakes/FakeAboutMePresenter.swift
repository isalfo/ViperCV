//
//  FakeAboutMePresenter.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeAboutMePresenter class
final class FakeAboutMePresenter: AboutMePresenterProtocol {
    // MARK: - Properties
    var interactor: AboutMeInteractorProtocol?
    var view: AboutMeViewProtocol?
    var router: AboutMeRouterProtocol?
    static var getAboutMeInfoIsCalled: Bool!
    static var sendAboutMeInfoIsCalled: Bool!
    static var sendErrorIsCalled: Bool!
    
    // MARK: - Methods
    func getAboutMeInfo() {
        FakeAboutMePresenter.getAboutMeInfoIsCalled = true
    }
    
    func sendAboutMeInfo(_ info: AboutModel) {
        FakeAboutMePresenter.sendAboutMeInfoIsCalled = true
    }
    
    func sendError(_ errorMessage: String) {
        FakeAboutMePresenter.sendErrorIsCalled = true
    }
}
