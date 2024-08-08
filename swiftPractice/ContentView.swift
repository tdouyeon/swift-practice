//
//  ContentView.swift
//  swiftPractice
//
//  Created by suyeon on 8/7/24.
//

import SwiftUI

<<<<<<< HEAD
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
=======
let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]


struct ContentView: View {
    @State private var numberOfDice: Int = 1

    var body: some View {
        TabView {
            VStack {
                Text("Dice Roller").font(.largeTitle.lowercaseSmallCaps())
                HStack {
                    ForEach(1...numberOfDice, id: \.description) { _ in
                        DiceView()
                    }
                }
                HStack {
                    Button("Remove Dice", systemImage: "minus.circle.fill") {
                        numberOfDice -= 1
                    }
                    .disabled(numberOfDice == 1)
                    Button("Add Dice", systemImage: "plus.circle.fill") {
                        numberOfDice += 1
                    }
                    .disabled(numberOfDice == 3)
                }
                .padding().labelStyle(.iconOnly)

            }
            HStack {
                weatherView(day: "Mon", isRainy: false, color:Color.yellow,temp:[50,70])
                weatherView(day: "Tue", isRainy: true, color:Color.blue, temp:[40,60])
            }
            WelcomePage()
            FeaturesPage()
        }.tabViewStyle(.page).background(Gradient(colors: gradientColors))
>>>>>>> bf8e0f515016e3bb059062c05e167a4d4073c68a
    }
}

#Preview {
    ContentView()
}
<<<<<<< HEAD
=======

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
>>>>>>> bf8e0f515016e3bb059062c05e167a4d4073c68a
