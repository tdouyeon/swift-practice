//
//  Friend.swift
//  swift-practice
//
//  Created by suyeon on 8/13/24.
//

import Foundation
import SwiftData

@Model
class Friend {
    let name: String
    let birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        // isDateInToday(): Calendar 클래스의 메서드 중 하나로, 주어진 날짜가 오늘인지 확인하는 데 사용
        Calendar.current.isDateInToday(birthday)
    }
}
