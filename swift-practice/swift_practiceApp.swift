//
//  swift_practiceApp.swift
//  swift-practice
//
//  Created by suyeon on 8/12/24.
//

import SwiftUI
import SwiftData

@main
struct swift_practiceApp: App {
    @State private var modelData = ModelData()
    
    var sharedModelContainer: ModelContainer {
         SampleData.shared.modelContainer // SampleData에서 ModelContainer 가져오기
     }

    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(sharedModelContainer)
            /*.environment(modelData)*/
//                .modelContainer(for: Friend.self)
        }
    }
}
