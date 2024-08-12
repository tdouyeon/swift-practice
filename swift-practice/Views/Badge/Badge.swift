//
//  Badge.swift
//  swiftPractice
//
//  Created by suyeon on 8/9/24.
//

import SwiftUI


struct Badge: View {
    var badgeSymbols: some View {
        /*
         index = 0:  0/8 = 0.0  →  0.0 × 360 = 0.0 degrees
         index = 1:  1/8 = 0.125  →  0.125 × 360 = 45.0 degrees
         index = 2:  2/8 = 0.25  →  0.25 × 360 = 90.0 degrees
         index = 3:  3/8 = 0.375  →  0.375 × 360 = 135.0 degrees
         index = 4:  4/8 = 0.5  →  0.5 × 360 = 180.0 degrees
         index = 5:  5/8 = 0.625  →  0.625 × 360 = 225.0 degrees
         index = 6:  6/8 = 0.75  →  0.75 × 360 = 270.0 degrees
         index = 7:  7/8 = 0.875  →  0.875 × 360 = 315.0 degrees
         */
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                //  top을 기준으로 1/4 로 사이즈 줄임. 즉, 아래가 줄어듦
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}


#Preview {
    Badge()
}
