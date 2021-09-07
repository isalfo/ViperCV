//
//  NetworkLayer.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import Foundation

// MARK: - Networking layer protocols
protocol NetworkingProtocol {
    func execute<T: Decodable>(_ endpoint: Endpoint,_ session: URLSession, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkingProtocol {
    func execute<T: Decodable>(_ endpoint: Endpoint,_ session: URLSession = .shared, completion: @escaping (Result<T, Error>) -> Void) {
    let urlRequest = endpoint.urlRequest
    
    session.dataTask(with: urlRequest) { data, _, error in
      do {
        if error != nil{
            completion(.failure(NetworkErrors.urlError))
          return
        }
        
        guard let data = data else { return }

        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        completion(.success(decodedObject))
      } catch {
        completion(.failure(NetworkErrors.parsingError))
      }
    }.resume()
  }
}

protocol RequestProviding {
  var urlRequest: URLRequest { get }
}

// MARK: - Errors enum
enum NetworkErrors: Error {
    case urlError
    case parsingError
}
