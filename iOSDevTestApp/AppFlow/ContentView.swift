//
//  ContentView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct ContentView: View {

    init() {
        setupNavigationBarAppearance()
    }
    
    var body: some View {
        AppFlowView()
//        CircularLoadingView()
    }

    private func setupNavigationBarAppearance() {

        let standartAppearence = UINavigationBarAppearance()
        standartAppearence.configureWithDefaultBackground()
        standartAppearence.backgroundColor = .clear
        standartAppearence.titleTextAttributes = [.foregroundColor: UIColor.white]
//        appearence.setBackIndicatorImage(.backButtonIcon.withRenderingMode(.alwaysOriginal), transitionMaskImage: .backButtonIcon)
//        appearence.shadowColor = nil
//        appearence.backButtonAppearance.normal.titlePositionAdjustment = .init(horizontal: -200, vertical: -200)

        let scrollAppearence = UINavigationBarAppearance()
        scrollAppearence.configureWithTransparentBackground()
        scrollAppearence.backgroundColor = .clear
        scrollAppearence.titleTextAttributes = [.foregroundColor: UIColor.white]

        // Apply the appearance settings to all navigation bars
        UINavigationBar.appearance().standardAppearance = standartAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = scrollAppearence
        UINavigationBar.appearance().compactAppearance = standartAppearence
    }
}

#Preview {
    ContentView()
}


extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
