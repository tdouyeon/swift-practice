/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The elevation, heart rate, and pace of a hike plotted on a graph.
*/

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        // dampingFraction : 애니메이션 부드럽게함
        Animation.spring(dampingFraction: 0.5)
        // 속도 2배
            .speed(2)
            .delay(0.03 * Double(index))
    }
}


struct HikeGraph: View {
    var hike: Hike
    var path: KeyPath<Hike.Observation, Range<Double>>

    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }

    var body: some View {
        let data = hike.observations
        
        // 그래프 전체 범위 설정(격차)
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        // 각 요소들 중 젤 격차가 큰 요소 찾음
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        
        // 가장 격차가 큰 값으로 높이 비율을 계산(y축 설정 위함) CGFloat으로 감싼 이유는 아래 있는 x, y 도 CGFloat이기 때문에 타입 일관성 유지 가능
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))

        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                //enumerated() 는 각 요소와 인덱스를 튜블 형태로 반환하기 때문에 ForEach를 돌리기 위해 Array로 묶어줌
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    GraphCapsule(
                        index: index,
                        color: color,
                        height: proxy.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange
                    )
                    .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

// 전체 요소의 가장 낮은 값과 가장 높은 값을 담은 Randge<Double> 구하는 함수
func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

// 개별 요소의 범위를 구하는 함수
func magnitude(of range: Range<Double>) -> Double {
    range.upperBound - range.lowerBound
}

#Preview {
    let hike = ModelData().hikes[0]
    return Group {
        HikeGraph(hike: hike, path: \.elevation)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.heartRate)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.pace)
            .frame(height: 200)
    }
}
