//
//  DetailView.swift
//  HackerNewsApp
//
//  Created by Dhruv Nakum on 2/11/26.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}
