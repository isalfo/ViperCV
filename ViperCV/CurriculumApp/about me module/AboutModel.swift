//
//  AboutModel.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 01/09/2021.
//

import Foundation

// MARK: Contact struct
struct AboutModel: Codable {
    let about: About
}

// MARK: - About struct
struct About: Codable {
    let summary: String
    let hobbies: String
    let skills: [String]
}
