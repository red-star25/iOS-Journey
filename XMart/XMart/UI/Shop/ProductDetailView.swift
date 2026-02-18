//
//  ProductDetailView.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/15/26.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var selectedImage: String?
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ZStack {
                        if let url = URL(string: selectedImage ?? product.thumbnail) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView().frame(maxWidth: .infinity, minHeight: 220)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity, minHeight: 200)
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
                    }
                    .frame(height: 280)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.all)
                    
                    Text(product.title)
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title3).bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(product.images, id:\.self) { urlString in
                                if let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView().frame(maxWidth: 50, minHeight: 50)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: 70, maxHeight: 70)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60,height: 60)
                                                .foregroundStyle(.secondary)
                                                .frame(maxWidth: 50, minHeight: 50)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .onTapGesture {
                                        selectedImage = urlString
                                    }
                                }
                            }
                        }
                    }
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
        .onAppear {
            if selectedImage == nil {
                selectedImage = product.thumbnail
            }
        }
    }
}

#Preview {
    ProductDetailView(product: Product.sampleProduct())
}
