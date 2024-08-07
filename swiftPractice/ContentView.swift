//
//  ContentView.swift
//  swiftPractice
//
//  Created by suyeon on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            Text("안녕!!!!").padding()             .background(Color.yellow, in:              RoundedRectangle(cornerRadius: 8))
            Text("뭐예요?")
                           .padding()
                           .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
