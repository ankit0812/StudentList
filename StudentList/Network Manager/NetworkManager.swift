//
//  NetworkManager.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    
    private init() {}
    
    func performRequest<T: Decodable>(_ request: URLRequestProtocol, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let urlRequest = try request.asURLRequest()
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(URLError(.badServerResponse)))
                    }
                    return
                }
                
                DispatchQueue.global(qos: .background).async {
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(decodedResponse))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                }
            }
            task.resume()
        } catch {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    }
}
