//
//  FakeCareerView.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
import UIKit
@testable import CurriculumApp

// MARK: FakeCareerView class
final class FakeCareerView: UIViewController, CareerViewProtocol {
    // MARK: - Properties
    var presenter: CareerPresenterProtocol?
    static var showJobsIsCalled: Bool!
    
    // MARK: - Methods
    func showJobs(_ jobs: [Work]) {
        FakeCareerView.showJobsIsCalled = true
    }
}
