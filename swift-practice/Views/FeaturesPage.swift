//
//  FeaturesPage.swift
//  swiftPractice
//
//  Created by suyeon on 8/7/24.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            FeatureCard(iconName: "person.2.crop.square.stack.fill",
                        description: "A multiline description about a feature paired with the image on the left.")
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
            
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
}
