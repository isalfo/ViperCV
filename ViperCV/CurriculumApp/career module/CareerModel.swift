//
//  CareerModel.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 01/09/2021.
//

import Foundation

// MARK: - CareerModel Struct
struct CareerModel: Codable {
    let work: [Work]
}

// MARK: Work struct
struct Work: Codable {
    let summary: String
    let company: String
    let position: String
    let startDate: String
    let endDate: String
}
