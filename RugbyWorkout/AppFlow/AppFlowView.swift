//
//  AppFlow.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 26.06.2024.
//

import SwiftUI

struct AppFlowView: View {

    init() {
        setupNavigationBarAppearance()
    }

    @State var showOnboarding = false
    @State private var isAnimating = false
    @State private var preloadActive = false
    let circleCount = 8
    let circleSize: CGFloat = 6.5
    let animationDuration: Double = 1.2

    var body: some View {
        ZStack {
            if preloadActive {
                preloadView
            } else {
                if showOnboarding {
                    OnboardingView() {
                        showOnboarding = false
                    }
                    .transition(.move(edge: .leading))
                } else {
                    Home()
                        .transition(.move(edge: .trailing))
                }
            }
        }
        .animation(.easeInOut, value: showOnboarding)
    }
}

private extension AppFlowView {

    var preloadView: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            ZStack {
                ForEach(0..<circleCount, id: \.self) { index in
                    Circle()
                        .fill(Color.white.opacity(1 - Double(index) / Double(circleCount)))
                        .frame(width: circleSize, height: circleSize)
                        .offset(y: -15)
                        .rotationEffect(.degrees(Double(index) / Double(circleCount) * 360))
                }
            }
            .rotationEffect(isAnimating ? .degrees(0) : .degrees(-360))
            .animation(
                Animation.linear(duration: animationDuration).repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
                Task {
                    try await Task.sleep(for: .seconds(3))
                    preloadActive = false
                }
            }
        }
    }

    func setupNavigationBarAppearance() {
        UINavigationBar.appearance().titleTextAttributes =  [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        UINavigationBar.appearance().barStyle = .black

    }
}

