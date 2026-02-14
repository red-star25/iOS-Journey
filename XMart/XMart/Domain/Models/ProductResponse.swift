//
//  ProductResponse.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

struct ProductResponse: Decodable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}
