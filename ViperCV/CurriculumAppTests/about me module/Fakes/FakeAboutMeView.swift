//
//  FakeAboutMeView.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
import UIKit
@testable import CurriculumApp

// MARK: FakeAboutMeView class
final class FakeAboutMeView: UIViewController, AboutMeViewProtocol {
    // MARK: - Properties
    var presenter: AboutMePresenterProtocol?
    static var showContactInfoIsCalled: Bool!
    
    // MARK: - Methods
    func showContactInfo(_ info: AboutModel) {
        FakeAboutMeView.showContactInfoIsCalled = true
    }
}
