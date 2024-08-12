//
//  ProfileEditor.swift
//  swiftPractice
//
//  Created by suyeon on 8/12/24.
//

import SwiftUI


struct ProfileEditor: View {
    @Binding var profile: Profile
    
    // ClosedRange<Date> : 시작과 끝이 포함된 날짜 범위를 나타냄
    var dateRange: ClosedRange<Date> {
        // 현재 설정된 목표 날짜로부터 1년 전의 날짜를 계산
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        // 현재 설정된 목표 날짜로부터 1년 후의 날짜를 계산
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    // tag: Picker나 List와 같은 SwiftUI 뷰에서 사용되는 선택 항목을 나타내는 태그를 설정, 이 항목이 선택될 때 Picker의 selection 값으로 season을 사용하게 함
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
