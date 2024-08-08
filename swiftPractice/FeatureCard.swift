//
//  FeatureCard.swift
//  swiftPractice
//
//  Created by suyeon on 8/7/24.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
             Image(systemName: iconName)
                 .font(.largeTitle)
            Text(description)
            Spacer()
        }.padding().background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
                .opacity(0.25)
                .brightness(-0.4)
        }


  }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left.")
}
