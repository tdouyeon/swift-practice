//
//  SampleData.swift
//  swift-practice
//
//  Created by suyeon on 8/13/24.
//

import Foundation
import SwiftData


@MainActor // SampleData 클래스가 메인 스레드에서 실행되어야 함을 나타냄
class SampleData { // 싱글톤패턴
    static let shared = SampleData()
    
    // 데이터 모델을 관리하고 저장소에 접근하는 역할(핵심)
    let modelContainer: ModelContainer
    
    // 데이터 모델을 관리하고 저장소에 접근하는 역할
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        // SwiftData에서 데이터 모델 구조를 설명하는 데 사용
        let schema = Schema([
            Movie.self,
        ])
        // isStoredInMemoryOnly: true 데이터가 메모리에만 저장되고 앱이 종료되면 데이터가 사라지도록 설정
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            // 정의한 스키마와 설정을 사용하여 ModelContainer를 초기화
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
    
    var movie: Movie {
        Movie.sampleData[0]
    }
}
