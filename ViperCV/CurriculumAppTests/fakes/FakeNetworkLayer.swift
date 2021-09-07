//
//  FakeNetworkLayer.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 30/08/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: FakeNetworkLayer class
final class FakeNetworkLayer: NetworkingProtocol {
    // MARK: - Methods
    func execute<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "FakeContact", ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
        let fakeContact = try? JSONDecoder().decode(Contact.self, from: data) else { return }
        completion(.success(fakeContact as! T))
    }
}
