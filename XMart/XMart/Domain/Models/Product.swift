//
//  Product.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

struct Product: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let thumbnail: String
}


extension Product {
    static func sampleProduct() -> Product {
        return Product(id: 1, title: "Test Title", description: "product description", price: 11.99, thumbnail: "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke.jpg")
    }
}
