//
//  ShopView.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

import SwiftUI

struct ShopView: View {
    /**
     @StateObject means SwiftUI creates and owns this ViewModel once for the life of the view.
     If we used @ObservedObject here, the ViewModel might get recreated when the view redraws (bad for networking + state).
     */
    @StateObject private var viewModel = ShopViewModel()
    
    var body: some View {
        
        NavigationStack{
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                } else {
                    List(viewModel.products) {product in
                        VStack(alignment: .leading) {
                            Text(product.title)
                            Text("$\(product.price, specifier: "%.2f")")
                        }
                    }
                }
            }
            .navigationTitle("Shop")
        }
        .task {
            await viewModel.loadProducts()
        }
    }
}

#Preview {
    ShopView()
}
