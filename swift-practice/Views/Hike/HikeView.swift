/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

// AnyTransition 구조체에 새로운 속성 추가 하기 위해 extension 선언
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        // asymmetric : 삽입 및 제거 애니메이션 다르게 작동
        .asymmetric(
            // 삽입 시 -> 오른쪽에서 들어오면서 동시에 불투명도 변함
            insertion: .move(edge: .trailing).combined(with: .opacity),
            // 제거 시 -> .scale로 축쇠되면서  동시에 불투명도 변함
            removal: .scale.combined(with: .opacity)
        )
    }
}
struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                
                Button {
                    withAnimation{
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
