//
//  DiceView.swift
//  DiceSwiftUI
//
//  Created by Dhruv Nakum on 2/11/26.
//

import SwiftUI

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

#Preview {
    DiceView(n: 1)
}
