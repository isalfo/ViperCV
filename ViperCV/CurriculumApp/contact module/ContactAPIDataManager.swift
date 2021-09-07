//
//  CurriculumAPIDataManager.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import Foundation

// MARK: ContactAPIDataManager class
final class ContactAPIDataManager: CurriculumAPIDataManagerProtocol {
    // MARK: - Properties
    var network: NetworkingProtocol = Networking()
    // MARK: - Methods
    func fetch(_ completion: @escaping (Result<Contact, Error>) -> Void) {
        network.execute(Endpoint.contact, completion: completion)
    }
}

// MARK: - Networking class
final class Networking: NetworkingProtocol { }

// MARK: - Endpoint enum
enum Endpoint {
    case contact
}

// MARK: - Endpoint definitions
extension Endpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .contact:
            guard let url = URL(string: NSLocalizedString("Endpoint_Request_URL_Text", comment: "")) else {
                preconditionFailure(NSLocalizedString("Endpoint_Request_Failure_Text", comment: ""))
            }
            
            return URLRequest(url: url)
        }
    }
}
