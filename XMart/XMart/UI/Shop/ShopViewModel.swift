//
//  ShopViewModel.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

import Foundation
import Combine

@MainActor
final class ShopViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func loadProducts() async {
        isLoading = true
        defer {isLoading = false}
        errorMessage = nil
        
        do {
            let client = APIClient()
            let response = try await client.fetchProducts()
            products = response.products
        } catch {
            errorMessage = error.localizedDescription
            print("Error fetching products, \(error)")
        }
    }
}
