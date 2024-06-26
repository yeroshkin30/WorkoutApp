//
//  AppFlow.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 26.06.2024.
//

import SwiftUI

struct AppFlowView: View {
    @State var showOnboarding = true
    @State private var isAnimating = false
    @State private var preloaderActive = true
    let circleCount = 8
    let circleSize: CGFloat = 6.5
    let animationDuration: Double = 1.2

    var body: some View {
        ZStack {
            if preloaderActive {
                preloaderView
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

extension AppFlowView {

    var preloaderView: some View {
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
                    preloaderActive = false
                }
            }
        }
    }
}
