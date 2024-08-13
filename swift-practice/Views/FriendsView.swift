//
//  FriendView.swift
//  swift-practice
//
//  Created by suyeon on 8/13/24.
//

import SwiftUI
import SwiftData

struct FriendView: View {
    // SwiftData에 데이터 배열을 요청
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    // SwiftData에 새 항목을 저장하려면 ModelContext가 필요
    // modelContext: 보기와 모델 컨테이너 간의 연결을 제공하므로 컨테이너의 항목을 가져오거나 삽입 및 삭제할 수 있음
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now

    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }

                    Text(friend.name)
                        .bold(friend.isBirthdayToday)                    
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                     Text("New Birthday")
                         .font(.headline)
                    // Date.distantPast: 오늘 기준으로 약 733,000년 전에 해당하는 날짜를 나타냄
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)

                        newName = ""
                        newDate = .now
                    }
                    .bold()
                 }
                .padding()
                .background(.bar)
            }
//            // task: 뷰가 생성될 때 비동기적으로 실행될 작업을 정의하는 데 사용
//            .task {
//                // context.insert: NSManagedObjectContext의 인스턴스로 Core Data에서 데이터를 관리하는 역할을 하며, 객체를 삽입, 삭제, 수정하는 작업을 수행
//                context.insert(Friend(name: "Elton Lin", birthday: .now))
//                context.insert(Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)))
//            }
        }
    }
}

#Preview {
    FriendView().modelContainer(for: Friend.self, inMemory: true)
}
