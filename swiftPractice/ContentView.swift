//
//  ContentView.swift
//  swiftPractice
//
//  Created by suyeon on 8/7/24.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView {
        HStack {
            weatherView(day: "Mon", isRainy: false, color:Color.yellow,temp:[50,70])
            weatherView(day: "Tue", isRainy: true, color:Color.blue, temp:[40,60])
        }
            WelcomePage()
            FeaturesPage()
        }.tabViewStyle(.page).background(Gradient(colors: gradientColors))
    }
}

#Preview {
    ContentView()
}

struct weatherView: View {
    let day:String;
    let isRainy:Bool;
    let color:Color;
    let temp: [Int];
    
    var body: some View {
        VStack {
            Text(day).font(Font.headline)
            Image(systemName: isRainy ? "cloud.rain.fill" : "sun.max.fill").padding(5)

                .foregroundStyle(color)
            Text("High: \(temp[0])").fontWeight(.semibold)
            Text("Low: \(temp[1])").fontWeight(.medium).foregroundStyle(Color.secondary)
        }
        .padding()
    }
}
