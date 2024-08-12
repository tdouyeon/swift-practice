//
//  Hike.swift
//  swiftPractice
//
//  Created by suyeon on 8/9/24.
//

import Foundation


// Codable: 해당 프로토콜을 사용하면 JSON 데이터의 구조와 Swift 구조체 간의 변환을 자동으로 처리
// 그 예로 Range<Double> 해놓으면 알아서 (303.149..<342.353) 이런식으로 변환됨
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]


    static var formatter = LengthFormatter()


    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }


    struct Observation: Codable, Hashable {
        var distanceFromStart: Double


        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
