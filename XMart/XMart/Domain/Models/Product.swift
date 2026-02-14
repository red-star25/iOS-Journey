//
//  Product.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

struct Product: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Double
    let thumbnail: String
}
