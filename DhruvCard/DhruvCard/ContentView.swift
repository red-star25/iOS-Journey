//
//  ContentView.swift
//  DhruvCard
//
//  Created by Dhruv Nakum on 2/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52).ignoresSafeArea(.all)
            VStack {
                Image("dhruv")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150,height: 150)
                    .clipShape(.circle)
                    .overlay(Circle().stroke(Color.white,lineWidth: 5))
                Text("Dhruv Nakum")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("iOS Developer")
                    .foregroundStyle(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "1111111111", imageName: "phone.fill")
                InfoView(text: "abc@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}

