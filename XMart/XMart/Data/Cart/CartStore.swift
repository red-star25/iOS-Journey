//
//  CartStore.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/18/26.
//

import Combine
import Foundation

final class CartStore: ObservableObject {
    @Published var items: [CartItem] = []
    
    private let storageKey = "cart_items"
    
    init() {
        load()
    }
    
    func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {return}
        items = (try? JSONDecoder().decode([CartItem].self, from: data)) ?? []
    }
    
    func save() {
        let data = try? JSONEncoder().encode(items)
        UserDefaults.standard.set(data, forKey: storageKey)
    }
    
    func add(product: Product) {
        if let index = items.firstIndex(where: {$0.productId == product.id}) {
            items[index].quantity += 1
            save()
            return
        }
        let newItem = CartItem(
            productId: product.id,
            title: product.title,
            price: product.price,
            thumbnail: product.thumbnail,
            quantity: 1
        )
        items.append(newItem)
        save()
    }
    
    func remove(id: Int) {
        items.removeAll{$0.productId == id}
        save()
    }
    
    func updateQuantity(id: Int, qty: Int) {
        if let index = items.firstIndex(where: {$0.productId == id}) {
            if qty <= 0 {
                remove(id: id)
                return
            }
            items[index].quantity = qty
            save()
        }
    }
}
