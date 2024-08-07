//
//  WelcomePage.swift
//  swiftPractice
//
//  Created by suyeon on 8/7/24.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10).frame(width:70, height:70).foregroundStyle(.white)
                Image(systemName: "flame.fill").font(.title).foregroundStyle(.red)

            }
            Text("Hello, World!").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top)
            Text("Description text").font(.title2)
            
        }.padding()
    }
}

#Preview {
    WelcomePage()
}
