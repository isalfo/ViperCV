//
//  FakeAchievementsView.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
import UIKit
@testable import CurriculumApp

// MARK: FakeAchievementsView class
final class FakeAchievementsView: UIViewController, AchievementsViewProtocol {
    // MARK: - Properties
    var presenter: AchievementsPresenterProtocol?
    static var showAchievementsIsCalled: Bool!
    
    // MARK: - Methods
    func showAchievements(_ achievements: String) {
        FakeAchievementsView.showAchievementsIsCalled = true
    }
}
