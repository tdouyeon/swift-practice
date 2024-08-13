//
//  Movie.swift
//  swift-practice
//
//  Created by suyeon on 8/13/24.
//

import Foundation
import SwiftData


@Model
final class Movie {
    var title: String
    var releaseDate: Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    // static으로 선언되어 클래스 레벨에서 사용 가능하며, 여러 인스턴스가 공유. 이 배열은 주로 테스트나 UI 미리보기에서 사용할 샘플 데이터를 정의하는 데 사용
    static let sampleData = [
        Movie(title: "Amusing Space Traveler 3",
              // timeIntervalSinceReferenceDate: 날짜 초기화 
              // -402_000_000 : 약 12.75년 이전
              releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Difficult Cat",
              releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Electrifying Trek",
              releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie(title: "Reckless Train Ride 2",
              releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "The Last Venture",
              releaseDate: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie(title: "Glamorous Neighbor",
              releaseDate: Date(timeIntervalSinceReferenceDate: 700_000_000))
    ]
}
