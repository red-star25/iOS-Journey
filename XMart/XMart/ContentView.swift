//
//  ContentView.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ShopView()
            }
            .tabItem {
                Label("Shop", systemImage: "bag")
            }
            
            NavigationStack {
                CartView()
                    .navigationTitle("Cart")
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
        }
    }
}

#Preview {
    ContentView()
}
