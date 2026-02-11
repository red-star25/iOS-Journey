//
//  ContentView.swift
//  I Am Rich SwiftUI
//
//  Created by Dhruv Nakum on 2/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,height: 200,alignment: .center)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
