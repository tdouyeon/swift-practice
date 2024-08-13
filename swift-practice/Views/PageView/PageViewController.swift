//
//  PageViewController.swift
//  swift-practice
//
//  Created by suyeon on 8/12/24.
//

import SwiftUI
import UIKit


// <Page: View> : 제네릭 타입의 매개변수
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int

    // Coordinator 객체를 생성하여 SwiftUI와 UIKit 간의 상호작용 관리
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // 뷰를 표시할 준비가 되면 해당 메서드를 한 번 호출한 다음 뷰 컨트롤러의 수명 주기를 관리 (뷰 컨트롤러의 인스턴스를 생성하고 반환)
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            // 페이지 전환 시 사용할 스타일, 스크롤 외에 pageCurl(책 넘김) 도 있음
            transitionStyle: .scroll,
            // 페이지 전환의 방향을 설정, 수평 외에 vertical도 있음
            navigationOrientation: .horizontal)

        // 이 설정을 통해 UIPageViewController는 Coordinator에서 페이지 전환에 관련된 이벤트를 요청하게 되며, dataSource, delegate 메서드를 통해 특정 동작을 수행할 수 있음
        //dataSource: 페이지에 대한 정보를 제공하는 역할
        pageViewController.dataSource = context.coordinator
        // delegate: 이벤트 처리
        pageViewController.delegate = context.coordinator

        return pageViewController
    }

    // SwiftUI 상태 변화에 따라 뷰 컨트롤러 업데이트
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            // context : SwiftUI의 Context 객체로, 현재 상태와 관련된 다양한 정보와 메서드가 포함되어 있음
            // context과 currentPage를 활용해 현재 페이지에 해당하는 뷰 컨트롤러를 가져옴
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    // UIPageViewControllerDataSource: 페이지 뷰 컨트롤러가 이전 페이지와 다음 페이지를 제공받기 위해 필요한 메서드를 정의, UIPageViewController와 상호작용 가능해짐
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            // 각각의 페이지를 UIHostingController로 래핑하여 controllers 배열에 저장. 이 래핑 작업은 SwiftUI 뷰를 UIKit의 UIViewController로 변환하여 UIPageViewController에서 사용할 수 있게 함
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // 현재 페이지 뷰 컨트롤러의 이전 페이지에 해당하는 뷰 컨트롤러를 반환
        func pageViewController(
                    _ pageViewController: UIPageViewController,
                    viewControllerBefore viewController: UIViewController) -> UIViewController?
                {
                    guard let index = controllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    if index == 0 {
                        return controllers.last
                    }
                    return controllers[index - 1]
                }

         // 현재 페이지 뷰 컨트롤러의 다음 페이지에 해당하는 뷰 컨트롤러를 반환
         func pageViewController(
                    _ pageViewController: UIPageViewController,
                    viewControllerAfter viewController: UIViewController) -> UIViewController?
                {
                    guard let index = controllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    if index + 1 == controllers.count {
                        return controllers.first
                    }
                    return controllers[index + 1]
                }
        
        //  페이지 전환 애니메이션이 완료될 때마다 이 메서드를 호출하므로 현재 뷰 컨트롤러의 인덱스를 찾아 바인딩을 업데이트
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            // 매개변수 , 매개변수 레이블 , 매개변수 타입
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index // 현재 페이지 인덱스를 업데이트
            }
        }
    }
}
