//
//  MockContact.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 02/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: DummyContact struct
struct DummyContact {
    // MARK: - Properties
    static let dummyContact: Contact = Contact(basics: Basics(name: "Gonzalo Alfonso", label: "iOS Mobile Developer", image: "https://i.ibb.co/fGSMGG9/Processed-with-VSCO-with-preset.jpg", email: "alfonsogonzalo02@gmail.com", location: Location(city: "La Plata", country: "Argentina")))
}
