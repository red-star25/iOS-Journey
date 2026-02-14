//
//  APIClient.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

import Foundation

class APIClient {
    let baseURL = URL(string: "https://dummyjson.com")!
    
    func fetchProducts() async throws -> ProductResponse {
        let url = baseURL.appendingPathComponent("products")
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
        return response
    }
}
