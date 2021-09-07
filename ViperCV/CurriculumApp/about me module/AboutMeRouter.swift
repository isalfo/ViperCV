//
//  AboutMeRouter.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation
import UIKit

// MARK: AboutMeRouter class
final class AboutMeRouter: AboutMeRouterProtocol {
    // MARK: - Methods
    func showError(_ message: String, view: AboutMeViewProtocol) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("ContactRouter_ShowError_Alert_Title_Text", comment: ""), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("ContactRouter_ShowError_AlertAction_Title_Text", comment: ""), style: .default, handler: nil))
            view.present(alert, animated: true, completion: nil)
        }
    }
}
