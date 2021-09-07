//
//  CareerRouter.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import Foundation
import UIKit

// MARK: CareerRouter class
final class CareerRouter: CareerRouterProtocol {
    // MARK: - Methods
    func sendAlert(from view: CareerViewProtocol, title: String) {
        let alert = UIAlertController(title: title, message: NSLocalizedString("CareerView_TableView_Alert_Message_Text", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("CareerView_TableView_AlertAction_Title_Text", comment: ""), style: .default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
    func showError(_ message: String, view: CareerViewProtocol) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("ContactRouter_ShowError_Alert_Title_Text", comment: ""), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("ContactRouter_ShowError_AlertAction_Title_Text", comment: ""), style: .default, handler: nil))
            view.present(alert, animated: true, completion: nil)
        }
    }
    
}
