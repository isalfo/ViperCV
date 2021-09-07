//
//  Contact.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import Foundation

// MARK: Contact struct
struct Contact: Codable {
    let basics: Basics
}

// MARK: Basics struct
struct Basics: Codable {
    let name: String
    let label: String
    let image: String
    let email: String
    let location: Location
}

// MARK: Location struct
struct Location: Codable {
    let city: String
    let country: String
}

// MARK: ContactFeatures enum
enum ContactFeatures: String {
    case career = "Career"
    case about = "About"
    case achievements = "Achievements"
    case notFound = ""
}
