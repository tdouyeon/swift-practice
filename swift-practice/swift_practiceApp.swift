//
//  swift_practiceApp.swift
//  swift-practice
//
//  Created by suyeon on 8/12/24.
//

import SwiftUI

@main
struct swift_practiceApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
