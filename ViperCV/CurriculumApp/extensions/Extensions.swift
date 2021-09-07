//
//  Extensions.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
import UIKit

// MARK: - UIImage extension
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
