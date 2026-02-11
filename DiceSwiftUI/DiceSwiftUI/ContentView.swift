//
//  ContentView.swift
//  DiceSwiftUI
//
//  Created by Dhruv Nakum on 2/11/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumer = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumer)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDiceNumer = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                .padding(.vertical)

            }
        }
    }
}

#Preview {
    ContentView()
}
