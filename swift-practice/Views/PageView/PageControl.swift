//
//  PageControl.swift
//  swift-practice
//
//  Created by suyeon on 8/13/24.
//

import SwiftUI
import UIKit


struct PageControl: UIViewRepresentable {
    // 총 페이지 추
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        // 값을 변경할 때 발생하는 이벤트를 처리하기 위한 설정
        control.addTarget(
            context.coordinator,
            // 이벤트가 발생할 때 호출할 메서드를 지정
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }


    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    
    
    class Coordinator: NSObject {
        var control: PageControl


        init(_ control: PageControl) {
            self.control = control
        }


        // UIPageControl의 값이 변경될 때 호출되는 메서드로, 현재 페이지를 업데이트하는 역할
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
