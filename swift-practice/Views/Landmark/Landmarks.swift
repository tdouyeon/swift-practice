//
//  RandMarks.swift
//  swiftPractice
//
//  Created by suyeon on 8/8/24.
//

import SwiftUI

struct Landmarks: View {
    var body: some View {
        VStack{
            MapView(coordinate: landmarks[0].locationCoordinate)
                .frame(height: 300)

            CircleImage(image: landmarks[0].image).offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()

                  Text("About Turtle Rock")
                      .font(.title2)
                  Text("Descriptive text goes here.")
            }.padding()
            
            Spacer()

        }
    }

}

#Preview {
    Landmarks()
}
