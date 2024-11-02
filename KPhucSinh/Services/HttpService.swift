//
//  HttpService.swift
//  KPhucSinh
//
//  Created by Jin on 2/11/24.
//

import Foundation

final class HttpService {
    
    static let shared = HttpService()
    
    func fetchData<T>(url: String, httpMethod: String) async throws -> T where T: Decodable {
     
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = httpMethod
        request.timeoutInterval = 30
        
        let (data,_) = try await URLSession.shared.data(for: request)
  
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch{
            throw NetworkError.invalidResponse
        }
    }
    
}

struct TestModel: Decodable {
    let completed: Bool
    let id: Int
    let title: String
    let userId: Int
}

enum NetworkError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case hasError
}
