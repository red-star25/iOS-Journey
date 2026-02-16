//
//  ProductDetailView.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/15/26.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    if let url = URL(string: product.thumbnail) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView().frame(maxWidth: .infinity, minHeight: 220)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .padding(.horizontal)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60,height: 60)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, minHeight: 220)
                            @unknown default:
                                EmptyView()
                                
                            }
                            
                        }
                    }
                    Text(product.title)
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title3).bold()
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProductDetailView(product: Product.sampleProduct())
}
