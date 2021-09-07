//
//  FakeContactView.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 02/09/2021.
//

import Foundation
import UIKit
@testable import CurriculumApp

// MARK: FakeContactView class
final class FakeContactView: UIViewController, ContactViewProtocol {
    // MARK: - Properties
    var presenter: ContactPresenterProtocol?
    static var getViewContactIsCalled: Bool!
    
    // MARK: - Methods
    func getViewContact(_ contact: Contact) {
        FakeContactView.getViewContactIsCalled = true
    }
    
    func goToPresenter(for sender: String, with contact: Contact) { }
    
    func hideLabels() { }
    
    func createErrorLabels() { }

}
