//
//  OnboardingView.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 26.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    let onStartTap: () -> Void

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Image(.player)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Unleash your potential".uppercased())
                    .foregroundStyle(.white)
                    .font(.customFont(name: .bebasNeue, size: 64))
                Text("Dive into the world of American football training. Explore dynamic workouts designed to unlock your gridiron potential.")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.system(size: 15))
                    .padding(.bottom, 44)
                Button {
                    onStartTap()
                } label: {
                    Text("Start".uppercased())
                        .font(.customFont(name: .bebasNeue, size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 54)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "arrow.right")
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.white)
                                .background(.white.opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
                                .padding(.trailing, 12)
                        }
                }
                .background(.customRed, in: RoundedRectangle(cornerRadius: 12))
            }
            .ignoresSafeArea()
        }
        .padding()
        .background(
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(maxHeight: .infinity)
            )
    }
}

#Preview {
    OnboardingView() {}
}
