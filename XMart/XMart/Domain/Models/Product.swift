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
    let images: [String]
}


extension Product {
    static func sampleProduct() -> Product {
        return Product(id: 1, title: "Test Title", description: "product description", price: 11.99, thumbnail: "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke.jpg", images: ["https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke.jpg","https://anchanto.com/wp-content/uploads/2024/11/e-commerce-product-image-best-practices-by-anchanto.jpg", "https://cdn.shopify.com/s/files/1/0070/7032/articles/ecommerce_20product_20recommendation_2f1656f9-4c76-427d-b91f-0f9730e1bdc0.png?v=1729516733"])
    }
}
