//
//  BadgeBackground.swift
//  swiftPractice
//
//  Created by suyeon on 8/9/24.
//

import SwiftUI


struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                //현재 뷰의 너비와 높이 중 작은 값을 선택하여 정사각형 모양으로 유지
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                // 너비 약 80%
                let xScale: CGFloat = 0.832
                // 중앙 위치(원래 width에서 xScale을 빼서 차이를 계산 후 그걸 현 width랑 곱하면 여백이 나옴 그걸 /2 하면 왼쪽으로부터 여백/2 하므로 중앙에 위치하게 됨)
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                // move(to:): 경로를 시작할 점으로 이동
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )


                HexagonParameters.segments.forEach { segment in
                    // 직선추가
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )

                    // 곡선 추가
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
                )
            )
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}


#Preview {
    BadgeBackground()
}
