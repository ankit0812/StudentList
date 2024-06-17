//
//  URLRequestProtocol.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation

protocol URLRequestProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: String { get }
    var commonHeaders: [String: String] { get }
    var additionalHeaders: [String: String]? { get }
    var queryParams: [String: String]? { get }
    
    func asURLRequest() throws -> URLRequest
}

extension URLRequestProtocol {
    
    var commonHeaders: [String: String] {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        if let queryParams = queryParams {
            urlComponents?.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        commonHeaders.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        additionalHeaders?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return request
    }
}
