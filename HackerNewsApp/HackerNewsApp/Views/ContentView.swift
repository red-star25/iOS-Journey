//
//  ContentView.swift
//  HackerNewsApp
//
//  Created by Dhruv Nakum on 2/11/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkManager.posts) { post in
                NavigationLink(destination:DetailView(url: post.url), label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                })
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
