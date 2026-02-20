//
//  XMartApp.swift
//  XMart
//
//  Created by Dhruv Nakum on 2/13/26.
//

import SwiftUI

@main
struct XMartApp: App {
    @StateObject private var cartStore = CartStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartStore)
        }
    }
}
