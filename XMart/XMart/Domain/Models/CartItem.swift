//
//  CartItems.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/18/26.
//

struct CartItem: Identifiable, Codable {
    var id: Int { productId }
    let productId: Int
    let title: String
    let price: Double
    let thumbnail: String
    var quantity: Int = 1
}
