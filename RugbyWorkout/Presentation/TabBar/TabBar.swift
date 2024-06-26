//
//  TabBar.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI

struct Home: View {
    @State private var selected: TabBarItem = .workout
    @State private var isTabBarHidden = false

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selected) {
                WorkoutFlowView(sets: setsArray,isTabBarHidden: $isTabBarHidden)
                    .tag(TabBarItem.workout)
                NavigationStack {
                    SettingsView(isTabBarHidden: $isTabBarHidden)
                }
                .tag(TabBarItem.settings)
            }
            .safeAreaInset(edge: .bottom) {
                if !isTabBarHidden {
                    tabBarButtonsView
                        .frame(maxWidth: .infinity, maxHeight: 57, alignment: .bottom)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)

                        .background(Color.rowBackground)
                }
            }
        }
    }
}

extension Home {
    var tabBarButtonsView: some View {
        HStack(alignment: .top, spacing: 0) {

            TabBarButton(selected: $selected, item: .workout)
                .frame(maxWidth: .infinity)
            Button {

            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color.customRed)
            }

            TabBarButton(selected: $selected, item: .settings)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview(body: {
    Home()
})
