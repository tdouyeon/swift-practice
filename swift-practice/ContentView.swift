//
//  ContentView.swift
//  swift-practice
//
//  Created by suyeon on 8/12/24.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]


struct ContentView: View {
    @State private var numberOfDice: Int = 1
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }


    var body: some View {
 

        TabView {
            FriendView()
            // selection : 현재 선택된 탭을 나타내는 상태 변수
            // $selection: 이 변수를 바인딩으로 사용하겠다는 의미, $ 변수가 변경되면 자동으로 UI 업데이트
            TabView(selection: $selection) {
                CategoryHome()
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                    .tag(Tab.featured)


                LandmarkList()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
            }
//            HikeView(hike: ModelData().hikes[0])
//            Badge()
//            Landmarks()
//            ListView()
//            VStack {
//                Text("Dice Roller").font(.largeTitle.lowercaseSmallCaps())
//                HStack {
//                    ForEach(1...numberOfDice, id: \.description) { _ in
//                        DiceView()
//                    }
//                }
//                HStack {
//                    Button("Remove Dice", systemImage: "minus.circle.fill") {
//                        numberOfDice -= 1
//                    }
//                    .disabled(numberOfDice == 1)
//                    Button("Add Dice", systemImage: "plus.circle.fill") {
//                        numberOfDice += 1
//                    }
//                    .disabled(numberOfDice == 3)
//                }
//                .padding().labelStyle(.iconOnly)
//            }
//            HStack {
//                weatherView(day: "Mon", isRainy: false, color:Color.yellow,temp:[50,70])
//                weatherView(day: "Tue", isRainy: true, color:Color.blue, temp:[40,60])
//            }
//            WelcomePage()
//            FeaturesPage()
        }/*.tabViewStyle(.page)*/
//            .background(Gradient(colors: gradientColors)) // mac OS에서 page가 안됨*/
    }
}

#Preview {
    ContentView().environment(ModelData())

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
