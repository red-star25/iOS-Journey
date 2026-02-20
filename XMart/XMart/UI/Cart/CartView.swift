//
//  CartView.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/19/26.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartStore: CartStore
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(cartStore.items){ item in
                    HStack(alignment: .top, spacing: 4) {
                        if let url = URL(string: item.thumbnail) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable().scaledToFit()
                                case .failure(_):
                                    Image(systemName: "photo")
                                        .foregroundStyle(.secondary)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(width: 56,height: 56)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                                .font(.headline)
                            HStack(spacing: 12) {
                                Button {
                                    let qty = item.quantity - 1
                                    cartStore.updateQuantity(id: item.productId, qty: qty)
                                } label: {
                                    Text("-")
                                }
                                Text("Qty: \(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                Button {
                                    let qty = item.quantity + 1
                                    cartStore.updateQuantity(id: item.productId, qty: qty)
                                } label: {
                                    Text("+")
                                }
                            }
                            .padding(.horizontal,8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color(.systemGray6))
                            )
                        }
                        Spacer()
                        
                        let lineTotal = item.price * Double(item.quantity)
                        VStack {
                            Text("$\(lineTotal, specifier: "%.2f")")
                                .font(.headline)
                           
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let id = cartStore.items[index].productId
                        cartStore.remove(id: id)
                    }
                })
                .padding(.vertical, 6)
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartStore())
}
