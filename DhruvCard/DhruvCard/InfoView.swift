//
//  InfoView.swift
//  DhruvCard
//
//  Created by Dhruv Nakum on 2/11/26.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(height: 50)
                    .overlay(HStack {
                        Image(systemName: imageName).foregroundStyle(.green)
                        Text(text)
                    })
                    .padding(.all)
    }
}


#Preview {
    InfoView(text: "1111111111", imageName: "phone.fill")
}
