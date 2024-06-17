//
//  StudentRequest.swift
//  StudentList
//
//  Created by KingpiN on 17/06/24.
//

import Foundation

struct StudentRequest: URLRequestProtocol {
    
    var baseURL: URL { URL(string: "https://freetestapi.com/api/v1")! }
    
    var path: String { "/students" }
    
    var method: String { "GET" }
    
    var additionalHeaders: [String: String]?
    
    var queryParams: [String: String]?
    
    init(query: String? = nil, additionalHeaders: [String: String]? = nil) {
        
        if let query = query, !query.isEmpty {
            queryParams = ["query": query]
        }
        self.additionalHeaders = additionalHeaders
    }
}
